//
//  NetworkClient.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 03/02/25.
//

import Foundation

protocol NetworkRequest {
    func request<T: Decodable>(type:T.Type, config: EndpointConfiguration) async throws -> Result<T, NetworkError>
}

public enum HttpRequestMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    
    var verb: String { rawValue }
}

enum ContentType: String {
    case urlEncoded = "application/x-www-form-urlencoded"
    case json = "application/json; charset=utf-8"
}

enum NetworkError: Error {
    case offlineError(message: String, statusCode: Int)
    case networkError(message: String, statusCode: Int)
    case invalidURL
    case mapFailure(message: String)
    case encodingError(message: String)
    case decodingError(message: String)
    case invalidPayload
    case emptyData
    case emptyMessage
    case message(message: String)
}

protocol EndpointConfiguration {
    var baseURL: String {get}
    var path: String {get}
    var httpMethod: HttpRequestMethod {get}
    var parameters: [String: Any] {get}
    func urlRequest() throws -> URLRequest
}

class NetworkManager: NetworkRequest {
    static let shared: NetworkManager = NetworkManager()

    private init() {}
    
    func request<T: Decodable>(type:T.Type, config: EndpointConfiguration) async throws -> Result<T, NetworkError> {
        let urlRequest = try config.urlRequest()
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let httpResponse = response as? HTTPURLResponse {
            guard (200..<300).contains(httpResponse.statusCode) else {
                return .failure(NetworkError.networkError(message: "NetworkError: ", statusCode: httpResponse.statusCode))
            }
        }

        guard !data.isEmpty else {
            return .failure(NetworkError.emptyData)
        }

        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedResponse)
        }
        catch {
            return .failure(NetworkError.decodingError(message: error.localizedDescription))
        }
    }
    
}


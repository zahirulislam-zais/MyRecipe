//
//  RecipeImageView.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 04/02/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURL url: String) {
        NetworkClient.shared.downloadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct RecipeImage: View {
    
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURL: urlString) }
    }
}

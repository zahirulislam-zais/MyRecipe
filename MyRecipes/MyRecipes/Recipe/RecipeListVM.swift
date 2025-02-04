//
//  RecipeListVM.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 03/02/25.
//

import Foundation

final class RecipeListVM: ObservableObject {
    
    @Published var recipes: [Recipes] = []
    @Published private var isLoading = false
    @Published private var alertItem: AlertItem?
    
    func getRecipe() {
        NetworkClient.shared.getRecipes { [self]
            result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let recipes):
                    self.recipes = recipes
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
            
        }
    }
}

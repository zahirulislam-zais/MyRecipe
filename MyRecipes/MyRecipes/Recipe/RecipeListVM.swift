//
//  RecipeListVM.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 03/02/25.
//

import Foundation

final class RecipeListVM: ObservableObject {
    
    @Published var recipes: [RecipeListModel.Recipes] = []
    
    func fetchRecipe() {
        let recipeUrlString = "https://dummyjson.com/recipes"
        if let url = URL(string: recipeUrlString) {
            
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    
                    if error != nil {
                        // TODO: handel error
                        print("Network Error")
                    } else {
                        let decoder = JSONDecoder()
                        
                        if let data = data,
                           let recipies = try? decoder.decode([RecipeListModel.Recipes].self, from: data) {
                            // TODO: handel setting the data
                            self?.recipes = recipies
                        } else {
                            // TODO: handel error
                            print("Network Error!!")
                        }
                    }
                    
                }.resume()
        }
    }
}

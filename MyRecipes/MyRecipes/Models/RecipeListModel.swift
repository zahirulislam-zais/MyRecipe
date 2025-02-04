//
//  RecipeListModel.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 03/02/25.
//

import Foundation

struct RecipeListModel: Codable {
    let id: Int
    var recipes: [Recipes]
    struct Recipes: Codable, Hashable {
        let id: Int
        let name: String
        let ingredients: [String]
        let instructions: [String]
        let prepTimeMinutes: Int
        let cookTimeMinutes: Int
        let servings: Int
        let difficulty: String
        let cuisine: String
        let caloriesPerServing: Int
        let image: String
        let rating: Float
        let reviewCount: Int
        let mealType: [String]
    }
}



//struct RecipeListModel: Codable, Identifiable {
//    var id = UUID()
//    
//    let recipeId: Int
//    let name: String
//    let ingredients: [String]
//    let instructions: [String]
//    let prepTimeMinutes: Int
//    let cookTimeMinutes: Int
//    let servings: Int
//    let difficulty: String
//    let cuisine: String
//    let caloriesPerServing: Int
//    let image: String
//    let rating: Float
//    let reviewCount: Int
//    let mealType: [String]
//    
//    enum CodingKeys: String, CodingKey {
//        case recipeId = "id"
//        case name
//        case ingredients
//        case instructions
//        case prepTimeMinutes
//        case cookTimeMinutes
//        case servings
//        case difficulty
//        case cuisine
//        case caloriesPerServing
//        case image
//        case rating
//        case reviewCount
//        case mealType
//    }
//}

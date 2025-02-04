//
//  RecipeListModel.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 03/02/25.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipes]
}

struct Recipes: Codable, Identifiable {
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

struct MockData {
    
    static let recipes = [sampleRecipe, sampleRecipe, sampleRecipe]
    
    static let sampleRecipe = Recipes(id: 0,
                                       name: "Classic Margherita Pizza",
                                       ingredients: ["Cheese", "Sour dough"],
                                       instructions: ["Instruction text goes here"],
                                       prepTimeMinutes: 20,
                                       cookTimeMinutes: 15,
                                       servings: 4,
                                       difficulty: "Easy",
                                       cuisine: "Italian",
                                       caloriesPerServing: 300,
                                       image: "https://cdn.dummyjson.com/recipe-images/1.webp",
                                       rating: 4.9,
                                       reviewCount: 98,
                                       mealType: ["Dinner"])
}

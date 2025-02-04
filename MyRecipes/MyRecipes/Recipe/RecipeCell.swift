//
//  RecipeCell.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 04/02/25.
//

import SwiftUI

struct RecipeCell: View {
    let recipies: RecipeListModel.Recipes
    
        
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name**: \(recipies.name)")
            Divider()
            Text("**Rating**: \(recipies.rating)")
            Text("**Reviews**: \(recipies.reviewCount)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}

struct RecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCell(recipies: .init(id: 0, name: "Classic Margherita Pizza", ingredients: ["Instruction text goes here"], instructions: ["Instruction text goes here"], prepTimeMinutes: 20, cookTimeMinutes: 10, servings: 4, difficulty: "Easy", cuisine: "Italian", caloriesPerServing: 300, image: "https://cdn.dummyjson.com/recipe-images/1.webp", rating: 4.6, reviewCount: 98, mealType: ["Dinner"]))
    }
}

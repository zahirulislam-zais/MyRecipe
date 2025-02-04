//
//  RecipeCell.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 04/02/25.
//

import SwiftUI

struct RecipeCell: View {
    
    let recipiess: Recipes
    
    var body: some View {
        HStack {
            RecipeImage(urlString: recipiess.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(recipiess.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("Rating \(recipiess.rating, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct RecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCell(recipiess: MockData.sampleRecipe)
    }
}

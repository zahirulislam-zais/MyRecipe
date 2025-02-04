//
//  RecipeListView.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 03/02/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var vm: RecipeListVM
    @State private var recipes: [Recipes] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(vm.recipes, id: \.id) { recipe in
                        RecipeCell(recipiess: recipe)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My Recipies")
            }
            .onAppear(perform: vm.getRecipe)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(vm: .init())
    }
}

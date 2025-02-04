//
//  MyRecipesApp.swift
//  MyRecipes
//
//  Created by Khushnoor Jamil on 03/02/25.
//

import SwiftUI

@main
struct MyRecipesApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeListView(vm: .init())
        }
    }
}

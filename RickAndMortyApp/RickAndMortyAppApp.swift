//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by Agustina Behotas on 19/03/2025.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    @StateObject private var viewModel = CharacterListViewModel() // Si usás MVVM
    
    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: viewModel)
        }
    }
}


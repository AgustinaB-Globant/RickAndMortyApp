//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Agustina Behotas on 19/03/2025.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel = CharacterListViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar personaje...", text: $searchText, onCommit: {
                    viewModel.searchCharacters(name: searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: searchText) { newValue in
                    if newValue.isEmpty {
                        viewModel.fetchCharacters() 
                    } else {
                        viewModel.searchCharacters(name: newValue)
                    }
                }

                List {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character) .transition(.move(edge: .trailing))) {
                            CharacterRowView(character: character)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                    } else if viewModel.hasMorePages {
                        Button("Cargar más") {
                            viewModel.fetchCharacters()
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Rick and Morty")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

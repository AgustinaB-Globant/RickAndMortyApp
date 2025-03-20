//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by Agustina Behotas on 19/03/2025.
//

import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var currentPage = 1
    private var totalPages = 1
    private var searchQuery = ""
    
    var hasMorePages: Bool {
        currentPage <= totalPages
    }
    
    func fetchCharacters(page: Int = 1, reset: Bool = false) {
        if reset {
            characters = []
            currentPage = 1
        }
        guard !isLoading, currentPage <= totalPages else { return }
        isLoading = true
        
        APIService.shared.fetchCharacters(page: currentPage, name: searchQuery) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    self.characters.append(contentsOf: response.results)
                    self.totalPages = response.info.pages
                    self.currentPage += 1
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func searchCharacters(name: String) {
        searchQuery = name
        fetchCharacters(reset: true)
    }
}

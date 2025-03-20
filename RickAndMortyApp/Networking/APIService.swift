//
//  APIService.swift
//  RickAndMortyApp
//
//  Created by Agustina Behotas on 19/03/2025.
//

import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "https://rickandmortyapi.com/api/character"
    
    func fetchCharacters(page: Int = 1, name: String = "", completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        var urlComponents = URLComponents(string: baseURL)!
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        if !name.isEmpty {
            urlComponents.queryItems?.append(URLQueryItem(name: "name", value: name))
        }
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

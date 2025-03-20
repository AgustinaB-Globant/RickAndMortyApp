//
//  RickAndMortyAppTests.swift
//  RickAndMortyAppTests
//
//  Created by Agustina Behotas on 19/03/2025.
//

import XCTest
@testable import RickAndMortyApp

class CharacterListViewModelTests: XCTestCase {

    var viewModel: CharacterListViewModel!
    
    override func setUpWithError() throws {
        viewModel = CharacterListViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchCharacters() {
        let expectation = XCTestExpectation(description: "Fetching characters")
        
        let mockURLSession = MockURLSession()
        viewModel.fetchCharacters(page: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertGreaterThan(self.viewModel.characters.count, 0, "Debe haber personajes después de cargar")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}

// Clase de mock para URLSession
class MockURLSession: URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let mockData = """
        {
            "results": [
                {
                    "id": 1,
                    "name": "Rick Sanchez",
                    "status": "Alive",
                    "species": "Human",
                    "gender": "Male",
                    "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
                }
            ]
        }
        """.data(using: .utf8)
        
        completionHandler(mockData, nil, nil)
    }
}

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}


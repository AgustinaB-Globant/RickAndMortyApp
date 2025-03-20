//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Agustina Behotas on 19/03/2025.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                
                Text(character.name).font(.largeTitle).padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    DetailRow(label: "Status", value: character.status)
                    DetailRow(label: "Species", value: character.species)
                    DetailRow(label: "Gender", value: character.gender)
                    DetailRow(label: "Origin", value: character.origin.name)
                    DetailRow(label: "Location", value: character.location.name)
                }
                .padding()
            }
        }
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(label):").bold()
            Text(value)
        }
    }
}

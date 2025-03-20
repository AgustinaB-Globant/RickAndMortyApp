//
//  CharacterRowView.swift
//  RickAndMortyApp
//
//  Created by Agustina Behotas on 19/03/2025.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character
    @State private var scale: CGFloat = 1.0 // Estado para la animación de escala

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFill()
                } else {
                    ProgressView()
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(character.name).font(.headline)
                Text(character.status).font(.subheadline)
            }
        }
    }
}

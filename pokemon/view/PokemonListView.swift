//
//  PokemonListView.swift
//  pokemon
//
//  Created by Haziq Abdullah on 11/03/2023.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonViewModel()
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 10) {
                    ForEach(viewModel.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: viewModel.filteredPokemon.count)
                .navigationTitle("Pokemon")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $viewModel.searchPokemon)
        }
        .environmentObject(viewModel)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

//
//  PokemonViewModel.swift
//  pokemon
//
//  Created by Haziq Abdullah on 11/03/2023.
//

import Foundation
import SwiftUI

final class PokemonViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetail: PokemonDetail?
    @Published var searchPokemon = ""
    
    var filteredPokemon: [Pokemon] {
        return searchPokemon == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchPokemon.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getPokemonDetail(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        self.pokemonDetail = PokemonDetail(id: 0, weight: 0, height: 0)
        
        pokemonManager.getPokemonDetail(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetail = data
            }
        }
    }
    
    func formatHeightWeight(value: Int) -> String {
        return String(format: "%.2F", Double(value) / 10)
    }
}

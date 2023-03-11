//
//  PokemonManager.swift
//  pokemon
//
//  Created by Haziq Abdullah on 12/03/2023.
//

import Foundation

class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonList = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getPokemonDetail(id: Int, _ completion:@escaping (PokemonDetail) -> ()) {
        let pokemonDetailUrl = "https://pokeapi.co/api/v2/pokemon/\(id)/"
        
        Bundle.main.fetchData(url: pokemonDetailUrl, model: PokemonDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}

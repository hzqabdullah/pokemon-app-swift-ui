//
//  Pokemon.swift
//  pokemon
//
//  Created by Haziq Abdullah on 11/03/2023.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

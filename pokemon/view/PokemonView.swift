//
//  PokemonView.swift
//  pokemon
//
//  Created by Haziq Abdullah on 12/03/2023.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    let pokemon: Pokemon
    let dimension: Double = 140
    
    var body: some View {
        let pokemonId = viewModel.getPokemonIndex(pokemon: pokemon)
        let imageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonId).png")
        VStack {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimension, height: dimension)
            } placeholder: {
                ProgressView()
                    .frame(width: dimension, height: dimension)
            }
            .background(.thinMaterial)
            .clipShape(Circle())

            Spacer()
                .frame(height: 16)
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon).environmentObject(PokemonViewModel())
    }
}

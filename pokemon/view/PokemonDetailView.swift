//
//  PokemonDetailView.swift
//  pokemon
//
//  Created by Haziq Abdullah on 12/03/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            VStack(spacing: 10) {
                Text("**ID**: \(viewModel.pokemonDetail?.id ?? 0)")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                Text("**Weight**: \(viewModel.formatHeightWeight(value: viewModel.pokemonDetail?.weight ?? 0)) KG")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                Text("**Height**: \(viewModel.formatHeightWeight(value: viewModel.pokemonDetail?.weight ?? 0)) M")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
            }
        }
        .onAppear {
            viewModel.getPokemonDetail(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon).environmentObject(PokemonViewModel())
    }
}

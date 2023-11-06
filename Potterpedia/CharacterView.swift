//
//  ContentView.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/4/23.
//

import SwiftUI

struct CharacterView: View {
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                let characters = $viewModel.characters
                ForEach(characters) { character in
                    Text(character.name.wrappedValue)
                }
            }
        }
        .navigationTitle("Character")
        .onAppear(perform: {
            viewModel.fetchCharacter()
        })
    }
}

#Preview {
    CharacterView()
}

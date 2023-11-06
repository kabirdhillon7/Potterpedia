//
//  ContentView.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/4/23.
//

import SwiftUI

struct CharacterView: View {
    @StateObject var viewModel = CharacterViewModel()
    
    let columns = [GridItem(.flexible(), spacing: 0),
                   GridItem(.flexible(), spacing: 0),
                   GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach($viewModel.characters) { character in
                        ZStack(alignment: .bottomLeading) {
                            AsyncImage(url: URL(string: character.image.wrappedValue)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                            } placeholder: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                            }
                            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                            Text(character.name.wrappedValue)
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 15))
                                .padding([.leading, .bottom], 5)
                        }
                    }
                }
            }
            .navigationTitle("Characters")
        }
        .onAppear(perform: {
            viewModel.fetchCharacter()
        })
    }
}

#Preview {
    CharacterView()
}
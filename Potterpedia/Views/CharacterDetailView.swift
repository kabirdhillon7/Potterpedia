//
//  CharacterDetailView.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/6/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        let character = viewModel.character
        ScrollView {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
            
            Text(character.name)
                .frame(width: .infinity, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
            
            Spacer()
                .frame(height: 15)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 4) {
                HStack {
                    Text("Species")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(character.species.capitalized)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack {
                    Text("Gender")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(character.gender.capitalized)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack {
                    Text("House")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(character.house)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack {
                    Text("Wizard")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(character.wizard ? "Yes" : "No")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack {
                    Text("Date of Birth")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(character.dateOfBirth ?? "N/A")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack {
                    let wand = character.wand
                    Text("Wand")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    VStack(spacing: 1, content: {
                        Text(wand.core)
                        Text(wand.wood)
                        if let length = wand.length {
                            Text(String(length))
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack {
                    Text("Actor")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(character.actor)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

#Preview {
    CharacterDetailView(viewModel: CharacterDetailViewModel(character: Character(id: "4c7e6819-a91a-45b2-a454-f931e4a7cce3", name: "Hermione Granger", alternateNames: [], species: "human", gender: "female", house: "Gryffindor", dateOfBirth: "19-09-1979", yearOfBirth: 1979, wizard: true, ancestry: "muggleborn", eyeColour: "brown", hairColour: "brown", wand: Wand(wood: "vine", core: "dragon heartstring", length: 10.75), patronus: "otter", hogwartsStudent: true, hogwartsStaff: false, actor: "Emma Watson", alternateActors: [], alive: true, image: "https://ik.imagekit.io/hpapi/hermione.jpeg")))
}

//
//  ContentView.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/4/23.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
        .navigationTitle("Character")
    }
}

#Preview {
    CharacterView()
}

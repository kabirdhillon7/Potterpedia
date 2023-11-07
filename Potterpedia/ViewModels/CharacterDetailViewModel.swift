//
//  CharacterDetailViewModel.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/6/23.
//

import Foundation

final class CharacterDetailViewModel: ObservableObject {
    var character: Character
    
    init(character: Character) {
        self.character = character
    }
}

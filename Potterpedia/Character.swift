//
//  Character.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/4/23.
//

import Foundation

/// Character model
struct Character: Decodable {
    let id: String
    let name: String
    let alternateNames: [String]
    let species: String
    let gender: String
    let house: String
    let dateOfBirth: String
    let yearOfBirth: Int
    let wizard: Bool
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let wand: [Wand]
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String
    let alternate_actors: [String?]
    let alive: Bool
    let image: String
}

/// Wand model
struct Wand: Decodable {
    let wood: String
    let core: String
    let length: Int
}

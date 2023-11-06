//
//  CharacterViewModel.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/5/23.
//

import Foundation

final class CharacterViewModel: ObservableObject {
    @Published var characters = [Character]()
    @Published var error: HarryPotterAPIError!
    
    var api: HarryPotterAPI = HarryPotterAPI()
    
    @MainActor func fetchCharacter() {
        Task {
            do {
                characters = try await api.getCharacters().get()
            } catch {
                print(error)
                if let hpError = error as? HarryPotterAPIError {
                    self.error = hpError
                } else {
                    self.error = .unexpected
                }
            }
        }
    }
}

//
//  CharacterViewModel.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/5/23.
//

import Foundation
import SwiftUI

final class CharacterViewModel: ObservableObject {
    @Published var networkingResult: Result<[Character], HarryPotterAPIError>
    var api: HarryPotterAPI
    
    init(neworkingResult: Result<[Character], HarryPotterAPIError>) {
        self.networkingResult = neworkingResult
        self.api = HarryPotterAPI()
    }
    
    func fetchCharacter() {
        Task {
            do {
                networkingResult = try await api.getCharacters()
            } catch {
                print(error)
                if let hpError = error as? HarryPotterAPIError {
                    networkingResult = .failure(hpError)
                } else {
                    networkingResult = .failure(.unexpected)
                }
            }
        }
    }
}

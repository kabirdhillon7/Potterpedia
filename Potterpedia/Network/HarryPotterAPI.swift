//
//  HarryPotterAPI.swift
//  Potterpedia
//
//  Created by Kabir Dhillon on 11/4/23.
//

import Foundation

/// Enum containing Harry Potter API endpoints
enum HarryPotterAPIEndpoints: String {
    case charaterUrl = "https://hp-api.onrender.com/api/characters"
}

/// Class responsible for making API calls to the Harry Potter API
class HarryPotterAPI {
    
    /// Fetches characters from the Harry Potter API
    /// - Returns: A Result type containing an array of `Character` objects or an error
    func getCharacters() async throws -> Result<[Character], HarryPotterAPIError> {
        guard let url = URL(string: HarryPotterAPIEndpoints.charaterUrl.rawValue) else {
            return .failure(.invalidUrl)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let characters = try decoder.decode([Character].self, from: data)
            return .success(characters)
        } catch {
            print(error)
            if let error = error as? URLError {
                switch error.code {
                case .badURL:
                    return .failure(.invalidUrl)
                default:
                    return .failure(.networkingError)
                }
            } else {
                return .failure(.decodingError)
            }
        }
    }
}

/// Enum representing Harry Potter API errors
enum HarryPotterAPIError: Error {
    case invalidUrl
    case networkingError
    case decodingError
    case unexpected
}

extension HarryPotterAPIError: LocalizedError {
    public var description: String {
        switch self {
        case .invalidUrl:
            return "An invalid url error occurred"
        case .networkingError:
            return "A networking error occurred"
        case .decodingError:
            return "A decoding error occurred"
        case .unexpected:
            return "An unexpected error occurred"
        }
    }
}

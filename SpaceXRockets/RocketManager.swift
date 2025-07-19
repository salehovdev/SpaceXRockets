//
//  RocketManager.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 19.07.25.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
}

class RocketManager {
    
    func fetchData(_ resource: String) async throws -> [Rockets] {
        guard let url = URL(string: resource) else { throw NetworkError.invalidUrl }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let response = try decoder.decode([Rockets].self, from: data)
        return response
    }
}

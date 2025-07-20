//
//  LaunchesModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import Foundation

struct Launches: Identifiable, Codable {
    let id: String
    let name: String
    let details: String?
    let rocket: String
    let success: Bool?
    let dateLocal: String
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case id, name, details, rocket, success, links
        case dateLocal = "date_local"
    }
}

struct Links: Codable {
    let patch: Patch
    let article: String?
    let wikipedia: String?
}

struct Patch: Codable {
    let small: String?
    let large: String?
}

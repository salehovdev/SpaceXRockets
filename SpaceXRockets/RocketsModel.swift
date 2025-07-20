//
//  RocketsModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 19.07.25.
//

import Foundation

struct Rockets: Identifiable, Codable {
    let id: String
    let name: String
    let firstFlight: String
    let successRatePct: Int
    let mass: Mass
    let height: Diameter
    let diameter: Diameter
    
    enum CodingKeys: String, CodingKey {
        case name, height, mass, diameter, id
        case firstFlight = "first_flight"
        case successRatePct = "success_rate_pct"
    }
}

struct Diameter: Codable {
    let meters: Double?
    let feet: Double?
}

struct Mass: Codable {
    let kg: Int
    let lb: Int
}

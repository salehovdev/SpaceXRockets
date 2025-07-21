//
//  RocketCacheModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 21.07.25.
//

import SwiftData

@Model
class RocketCacheModel {
    @Attribute(.unique) var id: String
    var name: String
    var firstFlight: String
    var successRatePct: Int
    var height: Double?
    var diameter: Double?
    var mass: Int

    init(from rocket: Rockets) {
        self.id = rocket.id
        self.name = rocket.name
        self.firstFlight = rocket.firstFlight
        self.successRatePct = rocket.successRatePct
        self.height = rocket.height.meters
        self.diameter = rocket.diameter.meters
        self.mass = rocket.mass.kg
    }
}

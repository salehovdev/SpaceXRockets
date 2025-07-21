//
//  LaunchCacheModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 21.07.25.
//

import SwiftData

@Model
class LaunchCacheModel {
    @Attribute(.unique) var id: String
    var name: String
    var details: String?
    var rocketId: String
    var success: Bool?
    var dateLocal: String
    var patchURL: String?
    var articleURL: String?
    var wikipediaURL: String?

    init(from launch: Launches) {
        self.id = launch.id
        self.name = launch.name
        self.details = launch.details
        self.rocketId = launch.rocket
        self.success = launch.success
        self.dateLocal = launch.dateLocal
        self.patchURL = launch.links.patch.large
        self.articleURL = launch.links.article
        self.wikipediaURL = launch.links.wikipedia
    }
    
    func forAPIModel() -> Launches {
        Launches(
            id: id,
            name: name,
            details: details,
            rocket: rocketId,
            success: success,
            dateLocal: dateLocal,
            links:
                Links(patch:
                        Patch(
                            small: "",
                            large: patchURL),
                      article: articleURL,
                      wikipedia: wikipediaURL)
        )
    }
}

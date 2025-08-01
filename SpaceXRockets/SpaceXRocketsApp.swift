//
//  SpaceXRocketsApp.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 15.07.25.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct SpaceXRocketsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: [RocketCacheModel.self, LaunchCacheModel.self])
    }
}

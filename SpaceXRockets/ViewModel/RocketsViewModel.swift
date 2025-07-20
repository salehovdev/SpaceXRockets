//
//  RocketsViewModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import Foundation

class RocketsViewModel: ObservableObject {
    @Published var rockets = [Rockets]()
    
    let manager = RocketManager()
    
    @MainActor
    func downloadRockets() async {
        do {
            let rockets = try await manager.fetchData(URLs.rocketUrl)
            DispatchQueue.main.async {
                self.rockets = rockets
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

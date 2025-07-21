//
//  RocketsViewModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import Foundation

class RocketsViewModel: ObservableObject {
    @Published var rockets = [Rockets]()
    @Published var launches = [Launches]()
    
    let manager = RocketManager()
    
    @MainActor
    func downloadRockets() async {
        do {
            let rockets: [Rockets] = try await manager.fetchData(URLs.rocketUrl)
            self.rockets = rockets
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func downloadLaunches() async {
        do {
            let launches: [Launches] = try await manager.fetchData(URLs.launchUrl)
            self.launches = launches
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func filteredLaunches(for rocketId: String) -> [Launches] {
        return launches.filter({ $0.rocket == rocketId })
    }
}

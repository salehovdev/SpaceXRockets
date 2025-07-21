//
//  RocketsViewModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import Foundation
import SwiftData

class RocketsViewModel: ObservableObject {
    @Published var rockets = [Rockets]()
    @Published var launches = [Launches]()
    
    let manager = RocketManager()
    
    @MainActor
    func downloadRockets(using modelContext: ModelContext) async {
        do {
            let rockets: [Rockets] = try await manager.fetchData(URLs.rocketUrl)
            self.rockets = rockets
            
            for rocket in rockets {
                let rocketModel = RocketCacheModel(from: rocket)
                modelContext.insert(rocketModel)
            }
            
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
            
            let cachedData = try? modelContext.fetch(FetchDescriptor<RocketCacheModel>())
            self.rockets = cachedData?.map { $0.forAPIModel() } ?? []
        }
    }
    
    @MainActor
    func downloadLaunches(using modelContext: ModelContext) async {
        do {
            let launches: [Launches] = try await manager.fetchData(URLs.launchUrl)
            self.launches = launches
            
            for launch in launches {
                let launchModel = LaunchCacheModel(from: launch)
                modelContext.insert(launchModel)
            }
            
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
            
            let cachedData = try? modelContext.fetch(FetchDescriptor<LaunchCacheModel>())
            self.launches = cachedData?.map { $0.forAPIModel() } ?? []
        }
    }
    
    func filteredLaunches(for rocketId: String) -> [Launches] {
        return launches.filter({ $0.rocket == rocketId })
    }
}

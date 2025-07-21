//
//  LaunchesView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import SwiftUI
import SwiftData

struct LaunchesView: View {
    @ObservedObject var viewModel: RocketsViewModel
    
    let rocketId: String
    
    init(rocketId: String) {
        self.viewModel = RocketsViewModel()
        self.rocketId = rocketId
    }
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredLaunches(for: rocketId)) { launch in
                NavigationLink {
                    LaunchDetailView(launch: launch)
                } label: {
                    Text(launch.name)
                }
            }
            .navigationTitle("\(viewModel.rockets.first(where: { $0.id == rocketId })?.name ?? "Rocket")")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.downloadLaunches(using: modelContext)
                await viewModel.downloadRockets(using: modelContext)
            }
        }
    }
}

#Preview {
    LaunchesView(rocketId: "5e9d0d95eda69955f709d1eb")
}

//
//  LaunchesView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import SwiftUI

struct LaunchesView: View {
    @ObservedObject var viewModel: RocketsViewModel
    
    let rocketId: String
    
    init(rocketId: String) {
        self.viewModel = RocketsViewModel()
        self.rocketId = rocketId
    }
    
    var body: some View {
        List(viewModel.filteredLaunches(for: rocketId)) { launch in
            Text(launch.name)
        }
        .task {
            await viewModel.downloadLaunches()
        }
    }
}

#Preview {
    LaunchesView(rocketId: "5e9d0d95eda69955f709d1eb")
}

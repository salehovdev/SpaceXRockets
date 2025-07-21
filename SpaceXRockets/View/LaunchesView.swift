//
//  LaunchesView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import SwiftUI

struct LaunchesView: View {
    @ObservedObject var viewModel: RocketsViewModel
    
    init() {
        self.viewModel = RocketsViewModel()
    }
    
    var body: some View {
        List(viewModel.launches) { launch in
            Text(launch.name)
        }
        .task {
            await viewModel.downloadLaunches()
        }
    }
}

#Preview {
    LaunchesView()
}

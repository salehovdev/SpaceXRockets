//
//  RocketsView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 17.07.25.
//

import SwiftUI

struct RocketsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Rocket's List View")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                }
            }
        }
        
    }
}

#Preview {
    RocketsView()
}

//
//  RocketsView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 17.07.25.
//

import SwiftUI

struct RocketsView: View {
    @StateObject var authViewModel = AuthenticationViewModel()
    @Binding var showSignUpView: Bool
    
    @ObservedObject var rocketsViewModel: RocketsViewModel
    
    @Environment(\.modelContext) private var modelContext
    
    init(showSignUpView: Binding<Bool>) {
        self.rocketsViewModel = RocketsViewModel()
        self._showSignUpView = showSignUpView
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(rocketsViewModel.rockets) { rocket in
                    NavigationLink {
                        LaunchesView(rocketId: rocket.id)
                    } label: {
                        RocketsRowView(rocket: rocket)
                    }
                }
            }
            .task {
                await rocketsViewModel.downloadRockets(using: modelContext)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Log out") {
                        Task {
                            do {
                                try authViewModel.logOut()
                                showSignUpView = true
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    RocketsView(showSignUpView: .constant(false))
}

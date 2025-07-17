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
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Rocket's List View")
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

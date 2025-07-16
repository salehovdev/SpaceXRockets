//
//  AuthenticationViewModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 15.07.25.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        Task {
            do {
                let userData = try await AuthenticationManager.shared.signUp(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}

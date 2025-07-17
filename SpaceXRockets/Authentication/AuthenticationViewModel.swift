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
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        try await AuthenticationManager.shared.signUp(email: email, password: password)
        
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        try await AuthenticationManager.shared.signIn(email: email, password: password)
    }
}

//
//  AuthenticationManager.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 15.07.25.
//

import Foundation
import FirebaseAuth

enum AuthError: Error {
    case userError
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    func signUp(email: String, password: String) async throws -> UserDataModel {
        let userResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return UserDataModel(user: userResult.user)
    }
    
    func getUser() throws -> UserDataModel {
        guard let user = Auth.auth().currentUser else { throw AuthError.userError }
        return UserDataModel(user: user)
    }
}

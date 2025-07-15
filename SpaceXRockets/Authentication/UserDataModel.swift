//
//  UserDataModel.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 15.07.25.
//

import Foundation
import FirebaseAuth

struct UserDataModel {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

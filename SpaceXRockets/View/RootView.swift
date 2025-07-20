//
//  RootView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 16.07.25.
//

import SwiftUI

struct RootView: View {
    @State private var showSignUpView = false
    
    var body: some View {
        ZStack {
            RocketsView(showSignUpView: $showSignUpView)
        }
        .onAppear {
            let user = try? AuthenticationManager.shared.getUser()
            self.showSignUpView = user == nil
        }
        .fullScreenCover(isPresented: $showSignUpView) {
            SignUpView(showSignUpView: $showSignUpView)
        }
    }
}

#Preview {
    RootView()
}

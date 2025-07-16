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
            Text("Rocket's List View")
        }
        .fullScreenCover(isPresented: $showSignUpView) {
            SignUpView()
        }
    }
}

#Preview {
    RootView()
}

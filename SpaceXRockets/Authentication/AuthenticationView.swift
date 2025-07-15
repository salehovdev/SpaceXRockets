//
//  AuthenticationView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 15.07.25.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .clipShape(.rect(cornerRadius: 10))
                
                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .clipShape(.rect(cornerRadius: 10))
                
                Button {
                    
                } label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 10))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Welcome to SpaceXRockets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AuthenticationView()
}

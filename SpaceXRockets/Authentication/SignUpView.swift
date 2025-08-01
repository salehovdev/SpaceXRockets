//
//  AuthenticationView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 15.07.25.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    @Binding var showSignUpView: Bool
    
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
                    Task {
                        do {
                            try await viewModel.signUp()
                            
                            if let _ = try? AuthenticationManager.shared.getUser() {
                                showSignUpView = false
                            } else {
                                print("Sign-up failed")
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                
                HStack {
                    Spacer()
                    Text("Do you have an account?")
                        .foregroundStyle(.gray)
                    NavigationLink {
                        SignInView(showSignUpView: $showSignUpView)
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                    }

                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Welcome to SpaceXRockets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SignUpView(showSignUpView: .constant(false))
}

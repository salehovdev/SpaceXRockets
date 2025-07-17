//
//  SignInView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 15.07.25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignInView: View {
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
                            try await viewModel.signIn()
                            showSignUpView = false
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 10))
                }
                
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .icon)) {
                    Task {
                        do {
                            try await viewModel.signInGoogle()
                            showSignUpView = false
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SignInView(showSignUpView: .constant(false))
}

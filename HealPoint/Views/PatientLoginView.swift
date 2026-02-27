//
//  PatientLoginView.swift
//  HealPoint
//
//

import SwiftUI

struct PatientLoginView: View {
    
    @StateObject private var authVM = AuthViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Patient Login")
                .font(.title)
                .bold()
            
            TextField("Email", text: $authVM.email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $authVM.password)
                .textFieldStyle(.roundedBorder)
            
            Button("Login") {
                appState.currentUser = User(
                    email: authVM.email,
                    role: .patient
                )
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

//
//  PatientLoginView.swift
//  HealPoint
//
//

import SwiftUI

struct PatientLoginView: View {
    
    @StateObject private var authVM = AuthViewModel()
    @State private var goToLocation = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Patient Login")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Email", text: $authVM.email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $authVM.password)
                .textFieldStyle(.roundedBorder)
            
            Button("Login") {
                authVM.loginAsPatient()
                if authVM.isAuthenticated {
                    goToLocation = true
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationDestination(isPresented: $goToLocation) {
            LocationPermissionView()
        }
    }
}

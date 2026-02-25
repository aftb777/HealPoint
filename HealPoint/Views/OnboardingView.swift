//
//  OnboardingView.swift
//  HealPoint
//
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("HealPoint")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Choose your role")
                .foregroundColor(.gray)
            
            NavigationLink("Sign in as Patient") {
                PatientLoginView()
            }
            .buttonStyle(.borderedProminent)
            
            Button("Sign in as Doctor") {
                // Doctor flow later
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

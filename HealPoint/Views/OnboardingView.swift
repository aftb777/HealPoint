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
                .bold()
            
            Text("Choose your role")
                .foregroundColor(.gray)
            
            NavigationLink("Sign in as Patient") {
                PatientLoginView()
            }
            .buttonStyle(.borderedProminent)
            
            NavigationLink("Sign in as Doctor") {
                DoctorOnboardingView()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

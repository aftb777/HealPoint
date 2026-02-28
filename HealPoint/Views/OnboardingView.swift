//
//  OnboardingView.swift
//  HealPoint
//
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                
                Image("HealPointImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .padding(30)
                    .background(
                        RoundedRectangle(cornerRadius: 35)
                            .fill(.ultraThinMaterial)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.45), radius: 25, x: 0, y: 15)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                
                
                Text("HealPoint")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                
                VStack(spacing: 20) {
                    
                    NavigationLink {
                        PatientLoginView()
                    } label: {
                        Text("Sign in as Patient")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.blue)
                            )
                    }
                    .padding(.horizontal, 30)
                    
                    NavigationLink {
                        DoctorOnboardingView()
                    } label: {
                        Text("Sign in as Doctor")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.green)
                            )
                    }
                    .padding(.horizontal, 30)
                }
                
                Spacer()
            }
            .padding(.top, 80)
        }
    }
}


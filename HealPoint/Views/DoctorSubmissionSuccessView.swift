//
//  DoctorSubmissionSuccessView.swift
//  HealPoint
//
//

import SwiftUI

struct DoctorSubmissionSuccessView: View {
    
    var doctor: Doctor
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Image(systemName: doctor.status == .approved ? "checkmark.seal.fill" : "hourglass")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(doctor.status == .approved ? .green : .orange)
            
            Text(doctor.status == .approved ? "Verification Approved" : "Application Submitted")
                .font(.title)
                .bold()
            
            Text(
                doctor.status == .approved
                ? "You are now a verified doctor on HealPoint."
                : "We are reviewing your documents. Please wait..."
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
        }
        .padding()
        .onChange(of: doctor.status) {
            
            if doctor.status == .approved {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    
                    dismiss()
                    
                    appState.currentUser = User(
                        email: doctor.name,
                        role: .doctor,
                        DoctorData: doctor
                    )
                }
            }
        }
    }
}

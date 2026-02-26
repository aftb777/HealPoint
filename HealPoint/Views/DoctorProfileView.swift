//
//  DoctorProfileView.swift
//  HealPoint
//
//

import SwiftUI

struct DoctorProfileView: View {
    
    var doctor: Doctor
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 20) {
            
            if let image = doctor.profileImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .foregroundColor(.blue)
            }
            
            Text("Dr. \(doctor.name)")
                .font(.title)
                .bold()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Specialization: \(doctor.specialization)")
                Text("License No: \(doctor.licenseNumber)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            
            Button("Logout") {
                appState.currentUser = nil
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            Spacer()
        }
        .padding()
    }
}

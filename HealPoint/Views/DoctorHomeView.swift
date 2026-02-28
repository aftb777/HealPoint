//
//  DoctorHomeView.swift
//  HealPoint
//
//

import SwiftUI

struct DoctorHomeView: View {
    
    var doctor: Doctor
    
    var body: some View {
        VStack(spacing: 0) {
            
            // TOP BAR
            HStack {
                Image("HealPointImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                
                Text("HealPoint")
                    .font(.headline)
                
                Spacer()
                
                Text("Dr. \(doctor.name)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(.ultraThinMaterial)
            
            Divider()
            
            TabView {
                
                DoctorAppointmentsView()
                    .tabItem {
                        Label("Appointments", systemImage: "calendar")
                    }
                
                DoctorProfileView(doctor: doctor)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    DoctorHomeView(
        doctor: Doctor(
            name: "Aftaab Mulla",
            specialization: "Cardiologist",
            licenseNumber: "HP-12345",
            profileImage: nil,
            certificateImage: nil,
            status: .approved
        )
    )
}

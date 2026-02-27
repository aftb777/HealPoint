//
//  DoctorDetailSheet.swift
//  HealPoint
//
//

import SwiftUI

struct DoctorDetailSheet: View {
    
    var doctor: Doctor
    @State private var showBooking = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Text(doctor.name)
                .font(.title)
                .bold()
            
            Text(doctor.specialization)
                .foregroundColor(.gray)
            
            Button("Book Appointment") {
                showBooking = true
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showBooking) {
            AppointmentBookingView(doctor: doctor)
        }
    }
}

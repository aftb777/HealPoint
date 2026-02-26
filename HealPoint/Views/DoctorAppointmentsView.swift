//
//  DoctorAppointmentsView.swift
//  HealPoint
//
//

import SwiftUI

struct Appointment: Identifiable {
    let id = UUID()
    var patientName: String
    var time: String
    var isCompleted: Bool = false
}

struct DoctorAppointmentsView: View {
    
    @State private var appointments: [Appointment] = [
        Appointment(patientName: "Rahul Sharma", time: "10:00 AM"),
        Appointment(patientName: "Anita Verma", time: "12:30 PM")
    ]
    
    var body: some View {
        List {
            ForEach($appointments) { $appointment in
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(appointment.patientName)
                            .font(.headline)
                        
                        Text(appointment.time)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    if appointment.isCompleted {
                        Label("Done", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                .swipeActions(edge: .trailing) {
                    
                    Button {
                        appointment.isCompleted = true
                    } label: {
                        Label("Completed", systemImage: "checkmark")
                    }
                    .tint(.green)
                }
            }
        }
        .navigationTitle("Appointments")
    }
}

//
//  AppointmentBookingView.swift
//  HealPoint
//
//

import SwiftUI

struct AppointmentBookingView: View {
    
    var doctor: Doctor
    
    @State private var patientName = ""
    @State private var patientAge = ""
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var showSuccess = false
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Patient Details")) {
                    TextField("Patient Name", text: $patientName)
                    TextField("Age", text: $patientAge)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Select Date")) {
                    DatePicker("Date",
                               selection: $selectedDate,
                               displayedComponents: .date)
                }
                
                Section(header: Text("Select Time")) {
                    DatePicker("Time",
                               selection: $selectedTime,
                               displayedComponents: .hourAndMinute)
                }
            }
            .navigationTitle("Book with \(doctor.name)")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirm") {
                        showSuccess = true
                    }
                }
            }
            .alert("Appointment Booked ✅",
                   isPresented: $showSuccess) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

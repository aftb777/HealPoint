//
//  PatientHomeView.swift
//  HealPoint
//
//

import SwiftUI

struct PatientHomeView: View {
    
    @State private var selectedDoctor: Doctor?
    @State private var showDoctorSheet = false
    @State private var searchText = ""
    
    let doctors: [Doctor] = [
        Doctor(name: "Dr. Sharma",
               specialization: "Cardiologist",
               licenseNumber: "HP-101",
               profileImage: nil,
               certificateImage: nil,
               status: .approved),
        
        Doctor(name: "Dr. Mehta",
               specialization: "Dermatologist",
               licenseNumber: "HP-202",
               profileImage: nil,
               certificateImage: nil,
               status: .approved)
    ]
    
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
                
                Button("Sign Out") {
                    print("Sign out tapped")
                }
                .foregroundColor(.red)
            }
            .padding()
            .background(.ultraThinMaterial)
            
            Divider()
            
            // SEARCH
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search doctor...", text: $searchText)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Nearest Doctors")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(filteredDoctors) { doctor in
                        
                        Button {
                            selectedDoctor = doctor
                            showDoctorSheet = true
                        } label: {
                            
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.blue)
                                
                                VStack(alignment: .leading) {
                                    Text(doctor.name)
                                        .font(.headline)
                                    
                                    Text(doctor.specialization)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text("Available")
                                    .foregroundColor(.green)
                                    .font(.caption)
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
        }
        .sheet(isPresented: $showDoctorSheet) {
            if let doctor = selectedDoctor {
                DoctorDetailSheet(doctor: doctor)
            }
        }
    }
    
    var filteredDoctors: [Doctor] {
        if searchText.isEmpty {
            return doctors
        } else {
            return doctors.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.specialization.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview{
    PatientHomeView()
}

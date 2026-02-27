//
//  PatientHomeView.swift
//  HealPoint
//
//

import SwiftUI
import CoreLocation

struct PatientHomeView: View {
    
    @StateObject private var locationVM = LocationViewModel()
    @EnvironmentObject var appState: AppState
    @State private var searchText: String = ""
    
    var body: some View {
        
        ZStack {
            
            // MARK: - MAIN HOME CONTENT
            if locationVM.isLocationAuthorized {
                
                VStack(spacing: 20) {
                    
                    // Top Bar
                    HStack {
                        Image("HealPointImg")
                            .resizable()
                            .frame(width: 35, height: 35)
                        
                        Text("HealPoint")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        Button("Sign Out") {
                            appState.currentUser = nil
                        }
                        .foregroundColor(.red)
                    }
                    .padding(.horizontal)
                    
                    
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search nearby doctors...", text: $searchText)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    
                    // Nearest Doctors Title
                    HStack {
                        Text("Nearest Doctors")
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                    // Doctors Scroll
                    ScrollView {
                        VStack(spacing: 15) {
                            
                            ForEach(filteredDoctors) { doctor in
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text(doctor.name)
                                        .font(.headline)
                                    
                                    Text(doctor.specialization)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            
            // MARK: - LOCATION PERMISSION SCREEN
            else {
                
                VStack(spacing: 25) {
                    
                    Text("Enable Location")
                        .font(.title)
                        .bold()
                    
                    Text("We use your location to show nearby doctors.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    Button("Allow Location Access") {
                        locationVM.requestPermission()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    }
    
    var dummyDoctors: [Doctor] {
        [
            Doctor(
                name: "Dr. Sharma",
                specialization: "Cardiologist",
                licenseNumber: "HP-123",
                profileImage: nil,
                certificateImage: nil,
                status: .approved
            ),
            Doctor(
                name: "Dr. Mehta",
                specialization: "Dermatologist",
                licenseNumber: "HP-456",
                profileImage: nil,
                certificateImage: nil,
                status: .approved
            ),
            Doctor(
                name: "Dr. Khan",
                specialization: "Orthopedic",
                licenseNumber: "HP-789",
                profileImage: nil,
                certificateImage: nil,
                status: .approved
            )
        ]
    }
    
    var filteredDoctors: [Doctor] {
        if searchText.isEmpty {
            return dummyDoctors
        } else {
            return dummyDoctors.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.specialization.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

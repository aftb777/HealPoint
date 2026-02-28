//
//  PatientRootView.swift
//  HealPoint
//
//

import SwiftUI

struct PatientRootView: View {
    
    @StateObject private var locationVM = LocationViewModel()
    
    var body: some View {
        
        Group {
            if locationVM.isLocationAuthorized {
                PatientHomeView()
            } else {
                ProgressView("Requesting Location...")
            }
        }
        .alert("Location Permission Required",
               isPresented: $locationVM.showPermissionAlert) {
            
            Button("Open Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
            
            Button("Cancel", role: .cancel) { }
            
        } message: {
            Text("Please enable location access from settings to continue.")
        }
    }
}

//
//  PatientRootView.swift
//  HealPoint
//
//

import SwiftUI

struct PatientRootView: View {
    
    @StateObject private var locationVM = LocationViewModel()
    
    var body: some View {
        
        ZStack {
            
            if locationVM.isLocationAuthorized {
                
                PatientHomeView()
                
            } else {
                
                ProgressView("Requesting Location...")
            }
        }
        .onAppear {
            locationVM.requestPermission()
        }
    }
}

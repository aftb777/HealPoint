//
//  LocationPermissionView.swift
//  HealPoint
//
//

import SwiftUI

struct LocationPermissionView: View {
    
    @StateObject private var locationVM = LocationViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Enable Location")
                .font(.title)
                .fontWeight(.bold)
            
            Text("We use your location to show nearby doctors.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
            Button("Allow Location Access") {
                locationVM.requestPermission()
            }
            .buttonStyle(.borderedProminent)
            
            if locationVM.permissionGranted {
                Text("Location Access Granted ✅")
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}

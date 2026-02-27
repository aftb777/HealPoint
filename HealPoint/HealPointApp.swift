//
//  HealPointApp.swift
//  HealPoint
//
//

import SwiftUI

@main
struct HealPointApp: App {
    
    @StateObject private var appState = AppState()
    @StateObject private var locationVM = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            if let user = appState.currentUser {
                
                if user.role == .patient {
                    
                    if locationVM.isLocationAuthorized {
                        PatientHomeView()
                    } else {
                        PatientRootView()
                    }
                    
                } else {
                    DoctorHomeView(
                        doctor: Doctor(
                            name: user.email,
                            specialization: "General",
                            licenseNumber: "HP-000",
                            profileImage: nil,
                            certificateImage: nil,
                            status: .approved
                        )
                    )
                }
                
            } else {
                NavigationStack {
                    OnboardingView()
                }
            }
        }
        .environmentObject(appState)
    }
}

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
                    
                } else if user.role == .doctor,
                          let doctor = user.DoctorData {
                    
                    DoctorHomeView(doctor: doctor)
                        .navigationBarBackButtonHidden(true)
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

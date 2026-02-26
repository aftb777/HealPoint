//
//  DoctorOnboardingViewModel.swift
//  HealPoint
//
//

import Foundation
import UIKit
import Combine 

class DoctorOnboardingViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var specialization = ""
    @Published var licenseNumber = ""
    
    @Published var profileImage: UIImage?
    @Published var certificateImage: UIImage?
    
    @Published var showSubmissionSheet = false
    @Published var verificationCompleted = false
    
    // Navigation
    @Published var approvedDoctor: Doctor?
    @Published var navigateToHome = false
    
    func submitApplication() {
        guard !name.isEmpty,
              !specialization.isEmpty,
              !licenseNumber.isEmpty else {
            return
        }
        
        showSubmissionSheet = true
        
        // Simulate verification delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let doctor = Doctor(
                name: self.name,
                specialization: self.specialization,
                licenseNumber: self.licenseNumber,
                profileImage: self.profileImage,
                certificateImage: self.certificateImage,
                status: .approved
            )
            
            self.approvedDoctor = doctor
            self.navigateToHome = true
            self.verificationCompleted = true
        }
    }
}

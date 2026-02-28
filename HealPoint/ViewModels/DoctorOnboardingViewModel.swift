//
//  DoctorOnboardingViewModel.swift
//  HealPoint
//
//

import Foundation
import UIKit
import Combine

class DoctorOnboardingViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var specialization: String = ""
    @Published var licenseNumber: String = ""
    @Published var profileImage: UIImage?
    @Published var certificateImage: UIImage?
    
    @Published var approvedDoctor: Doctor?
    @Published var showSubmissionSheet = false
    
    func submitApplication() {
        
        let doctor = Doctor(
            name: name,
            specialization: specialization,
            licenseNumber: licenseNumber,
            profileImage: profileImage,
            certificateImage: certificateImage,
            status: .pending   
        )
        
        approvedDoctor = doctor
        showSubmissionSheet = true
        
        // simulate review delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.approvedDoctor?.status = .approved
        }
    }
}

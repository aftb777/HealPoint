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
    
    func submitApplication() {
        guard !name.isEmpty,
              !specialization.isEmpty,
              !licenseNumber.isEmpty,
              profileImage != nil,
              certificateImage != nil else {
            return
        }
        
        showSubmissionSheet = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.verificationCompleted = true
        }
    }
}

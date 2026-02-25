//
//  Doctor.swift
//  HealPoint
//
//

import Foundation
import UIKit

struct Doctor: Identifiable {
    let id = UUID()
    var name: String
    var specialization: String
    var licenseNumber: String
    var profileImage: UIImage?
    var certificateImage: UIImage?
    var status: VerificationStatus = .pending
}

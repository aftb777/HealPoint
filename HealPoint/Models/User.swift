//
//  User.swift
//  HealPoint
//
//

import Foundation

enum UserRole {
    case patient
    case doctor
}

struct User {
    var email: String
    var role: UserRole
    var DoctorData: Doctor? = nil
}

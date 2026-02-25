//
//  AuthViewModel.swift
//  HealPoint
//
//

import Foundation
import Combine

class AuthViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    
    func loginAsPatient() {
        if email == "patient@test.com" && password == "1234" {
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }
}

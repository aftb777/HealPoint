//
//  AppState.swift
//  HealPoint
//
//

import Foundation
import Combine

class AppState: ObservableObject{
    @Published var currentUser: User? = nil
}

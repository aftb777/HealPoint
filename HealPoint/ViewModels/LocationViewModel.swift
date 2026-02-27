//
//  LocationViewModel.swift
//  HealPoint
//
//

import Foundation
import CoreLocation
import Combine

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    @Published var isLocationAuthorized = false
    
    override init() {
        super.init()
        manager.delegate = self
        checkPermission()
    }
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    private func checkPermission() {
        let status = manager.authorizationStatus
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            isLocationAuthorized = true
        } else {
            isLocationAuthorized = false
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkPermission()
    }
}

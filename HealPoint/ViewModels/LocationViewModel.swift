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
    @Published var showPermissionAlert = false
    
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
        
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            
        case .authorizedWhenInUse, .authorizedAlways:
            isLocationAuthorized = true
            
        case .denied, .restricted:
            isLocationAuthorized = false
            showPermissionAlert = true
            
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkPermission()
    }
}

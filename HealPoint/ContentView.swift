//
//  ContentView.swift
//  HealPoint
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var appState = AppState()
    
    var body: some View {
        NavigationStack {
            OnboardingView()
        }
        .environmentObject(appState)
    }
}

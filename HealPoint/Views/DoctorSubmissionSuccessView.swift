//
//  DoctorSubmissionSuccessView.swift
//  HealPoint
//
//

import SwiftUI

struct DoctorSubmissionSuccessView: View {
    
    @EnvironmentObject var vm: DoctorOnboardingViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            
            Image(systemName: vm.verificationCompleted ? "checkmark.seal.fill" : "hourglass")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(vm.verificationCompleted ? .green : .orange)
            
            Text(vm.verificationCompleted ? "Verification Approved" : "Application Submitted")
                .font(.title)
                .bold()
            
            Text(
                vm.verificationCompleted
                ? "You are now a verified doctor on HealPoint."
                : "We are reviewing your documents. Please wait..."
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
        }
        .padding()
    }
}

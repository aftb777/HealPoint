//
//  DoctorOnboardingView.swift
//  HealPoint
//
//

import SwiftUI

struct DoctorOnboardingView: View {
    
    @StateObject private var vm = DoctorOnboardingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                
                Text("Doctor Verification")
                    .font(.largeTitle)
                    .bold()
                
                // Profile Photo
                VStack {
                    if let image = vm.profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    } else {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 120, height: 120)
                    }
                    
                    ImagePicker(selectedImage: $vm.profileImage)
                }
                
                TextField("Full Name", text: $vm.name)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Specialization", text: $vm.specialization)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Medical License Number", text: $vm.licenseNumber)
                    .textFieldStyle(.roundedBorder)
                
                // Certificate Upload
                VStack(alignment: .leading) {
                    Text("Upload License Certificate")
                        .font(.headline)
                    
                    ImagePicker(selectedImage: $vm.certificateImage)
                }
                
                Button("Submit for Verification") {
                    vm.submitApplication()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
            .padding()
        }
        .sheet(isPresented: $vm.showSubmissionSheet) {
            DoctorSubmissionSuccessView()
                .environmentObject(vm)
        }
    }
}

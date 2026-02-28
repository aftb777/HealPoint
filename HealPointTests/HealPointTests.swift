//
//  HealPointTests.swift
//  HealPointTests
//
//

import Testing
@testable import HealPoint

struct HealPointTests {

    @Test func patientLogin() async throws {
        let user = User(email: "patient@test.com",
                        role: .patient,
                        DoctorData: nil
        )
        #expect(user.email == "patient@test.com")
        #expect(user.role == .patient)
        #expect(user.DoctorData == nil)
    }

}

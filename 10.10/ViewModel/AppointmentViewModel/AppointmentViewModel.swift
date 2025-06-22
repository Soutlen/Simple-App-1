//
//  AppointmentViewModel.swift
//  10.10
//
//  Created by Евгений Глоба on 6/2/25.
//

import Foundation
import SwiftUI

class AppointmentViewModel: ObservableObject {
    @Published var selectDate = Date()
    @Published var showConfirmation = false
    
    private let appointmentManager = AppointmentManager.shared
    private let doctor: DoctorModel
    
    init(doctor: DoctorModel) {
        self.doctor = doctor
    }
    
    func makeAppointment() {
        appointmentManager.addAppointment(doctorName: doctor.firstName,
                                          date: selectDate,
                                          email: "test@test.com")
        showConfirmation = true
    }
    
    var doctorFullName: String {
        "\(doctor.firstName) \(doctor.secondName)"
    }
}

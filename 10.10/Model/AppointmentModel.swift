//
//  AppointmentModel.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//

import Foundation

struct Appointment: Identifiable {
    let id = UUID()
    let doctorName: String
    let date: Date
    let email: String
}

class AppointmentManager: ObservableObject {
    static let shared = AppointmentManager()
    
    @Published var appointments: [Appointment] = []
    
    private init() {}
    
    func addAppointment(doctorName: String, date: Date, email: String) {
        let appointnemt = Appointment(doctorName: doctorName,
                                      date: date,
                                      email: email)
        appointments.append(appointnemt)
    }
}

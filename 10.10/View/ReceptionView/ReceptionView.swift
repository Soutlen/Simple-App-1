//
//  ReceptionView.swift
//  10.10
//
//  Created by Евгений Глоба on 5/31/25.
//

//import SwiftUI

//struct ReceptionView: View {
//    var body: some View {
//        Text("ReceptionView")
//    }
//}

import SwiftUI

struct ReceptionView: View {
    @StateObject private var appointManager = AppointmentManager.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(appointManager.appointments) { appointment in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(appointment.doctorName)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(appointment.date.formatted(date: .long, time: .shortened))
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Мои записи")
        }
    }
}

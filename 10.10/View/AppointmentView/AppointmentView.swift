//
//  AppointmentView.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//

import SwiftUI

struct AppointmentView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: AppointmentViewModel
    
    init(doctor: DoctorModel) {
        _viewModel = StateObject(wrappedValue: AppointmentViewModel(doctor: doctor))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Выберите дату")
                        .font(.title2)
                        .padding(.top)
                    
                    DatePicker("Дата", selection: $viewModel.selectDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.graphical)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    
                    Button("Записаться") {
                        viewModel.makeAppointment()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert("Запись подтверждена", isPresented: $viewModel.showConfirmation) {
                Button("Ок") {
                    dismiss()
                }
            } message: {
                Text("Вы успешно записались на прием к \(viewModel.doctorFullName)")
            }
        }
    }
}

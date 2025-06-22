//
//  DoctorCell.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//

import SwiftUI

//MARK: -Doctor Cell
struct DoctorCell: View {
    let doctor: DoctorModel
    @State private var isPressed = false
    @State private var showAppointmentView = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 12) {
                Image(doctor.photoProfile)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("\(doctor.firstName) \(doctor.middleName)")
                        .foregroundStyle(.black)
                        .font(.system(size: 16, weight: .bold))
                    
                    HStack(spacing: 6) {
                        Text(String(format: "%.1f из 5.0", doctor.rating))
                            .foregroundStyle(.gray)
                            .font(.system(size: 12))
                    }
                    .padding(.top, 8)
                    
                    HStack(spacing: 6) {
                        Text(doctor.profession)
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                        Text("-")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                        Text("стаж \(doctor.experience) лет")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                    }
                    .padding(.top, 8)
                    
                    HStack(spacing: 6) {
                        Text("от \(doctor.price)₽")
                            .foregroundStyle(.black)
                            .font(.system(size: 14, weight: .bold))
                    }
                    .padding(.top, 8)
                    
                }
                Spacer()
                Button {
                    isPressed.toggle()
                } label: {
                    Image(systemName: isPressed ? "heart.fill" : "heart")
                        .foregroundColor(isPressed ? Color.pink : Color.gray)
                        .font(.system(size: 24))
                        .frame(width: 44, height: 44)
                }
            }
            .padding(.horizontal, 15)
            
            Button(action: {
                showAppointmentView = true
            }) {
                Text("Записаться")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 47)
                    .background(Color.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 8)
            .padding(.top, 2)
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(16)
        .sheet(isPresented: $showAppointmentView) {
            AppointmentView(doctor: doctor)
        }
    }
}

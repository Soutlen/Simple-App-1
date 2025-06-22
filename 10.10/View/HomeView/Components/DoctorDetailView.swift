//
//  DoctorDetailView.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//
//

import SwiftUI

struct DoctorDetailView: View {
    let doctor: DoctorModel
    @State private var showAppointmentView = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(doctor.profession)")
                    .foregroundStyle(.black)
                    .font(.system(size: 20, weight: .bold))
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(doctor.photoProfile)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading) {
                            Text(doctor.secondName)
                                .foregroundStyle(.black)
                                .font(.system(size: 16, weight: .bold))
                            
                            Text("\(doctor.firstName) \(doctor.middleName)")
                                .foregroundStyle(.black)
                                .font(.system(size: 16, weight: .bold))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .foregroundStyle(.gray)
                                .frame(width: 24, height: 24)
                            
                            Text("Опыт работы: \(doctor.experience) лет")
                        }
                        .padding(.top, 20)
                        
                        HStack {
                            Image(systemName: "cross.case")
                                .resizable()
                                .foregroundStyle(.gray)
                                .frame(width: 24, height: 24)
                            
                            Text(doctor.category)
                                .foregroundStyle(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        HStack {
                            Image(systemName: "graduationcap.fill")
                                .resizable()
                                .foregroundStyle(.gray)
                                .frame(width: 24, height: 24)
                            
                            Text(doctor.education)
                                .foregroundStyle(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        HStack {
                            Image(systemName: "location")
                                .resizable()
                                .foregroundStyle(.gray)
                                .frame(width: 24, height: 24)
                            Text(doctor.placeWork)
                                .foregroundStyle(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    VStack {
                        HStack {
                            Text("Стоимость услуг")
                                .foregroundStyle(.black)
                                .font(.system(size: 16, weight: .bold))
                            
                            Spacer()
                            
                            Text("\(doctor.price)")
                                .foregroundStyle(.black)
                                .font(.system(size: 16, weight: .bold))
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 38)
                        
                        HStack {
                            Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                                .foregroundStyle(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding(.top, 30)
                    }
                    .padding(.horizontal, 16)
                }
                
                Spacer()
                
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
                .padding(.bottom, 20)
                .padding(.top, 10)
            }
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $showAppointmentView) {
            AppointmentView(doctor: doctor)
        }
    }
}

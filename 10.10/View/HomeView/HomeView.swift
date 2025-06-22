//
//  HomeView.swift
//  10.10
//
//  Created by Евгений Глоба on 5/31/25.
//

import SwiftUI

//MARK: -Home View
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
   
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 16) {
                Text("Педиатры")
                    .font(.system(size: 18, weight: .bold))

                TextField("Введите имя врача", text: $viewModel.searchText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5))
                    )
            }
            .padding()
            
            VStack(alignment: .leading) {
                Picker("Фильтр", selection: $viewModel.selectedFilter) {
                    ForEach(viewModel.filters, id: \.self) { item in
                        Text(item).tag(item)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
            }
            
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach(viewModel.filteredDoctors) { doctor in
                            Button {
                                viewModel.selectDoctor(doctor)
                            } label: {
                                DoctorCell(doctor: doctor)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationDestination(isPresented: $viewModel.isShowingDetails) {
                if let doctor = viewModel.selectedDoctor {
                    DoctorDetailView(doctor: doctor)
                } else {
                    Text("Доктор не выбран")
                }
            }
        }
    }
}

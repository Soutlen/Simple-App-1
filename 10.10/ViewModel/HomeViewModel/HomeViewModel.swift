//
//  HomeViewModel.swift
//  10.10
//
//  Created by Евгений Глоба on 6/2/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var selectedFilter = "По цене"
    @Published var selectedDoctor: DoctorModel?
    @Published var isShowingDetails = false
    
    let filters = ["По цене", "По рейтингу", "По стажу"]
    private let doctor = DoctorModel.getDoctorsData()
    
    var filteredDoctors: [DoctorModel] {
        let filtered = doctor.filter { doctor in
            searchText.isEmpty ||
            doctor.firstName.localizedCaseInsensitiveContains(searchText) ||
            doctor.secondName.localizedCaseInsensitiveContains(searchText)
        }
        
        switch selectedFilter {
        case "По цене":
            return filtered.sorted { $0.price > $1.price }
        case "По рейтингу":
            return filtered.sorted { $0.rating > $1.rating }
        case "По стажу":
            return filtered.sorted { $0.experience > $1.experience }
        default:
            return filtered
        }
    }
    
    func selectDoctor(_ doctor: DoctorModel) {
        selectedDoctor = doctor
        isShowingDetails = true
    }
}

//
//  DoctorModel.swift
//  10.10
//
//  Created by Евгений Глоба on 5/31/25.
//

import Foundation

struct DoctorModel: Identifiable {
    let id = UUID()
    let price: Int
    let rating: Double
    let experience: Int
    let firstName: String
    let secondName: String
    let middleName: String
    let profession: String
    let photoProfile: String
    let category: String
    let education: String
    let placeWork: String
    
    static func getDoctorsData() -> [DoctorModel] {[
        DoctorModel(price: 600,
                    rating: 5.0,
                    experience: 27,
                    firstName: "Дарья",
                    secondName: "Семеновна",
                    middleName: "Сергеевна",
                    profession: "Педиатор",
                    photoProfile: "Daria",
                    category: "Врач высшей категории",
                    education: "1-й ММИ им. М.М.Сеченова",
                    placeWork: "Детская клиника РебёнОК"),
        
        DoctorModel(price: 1_000,
                    rating: 4.0,
                    experience: 10,
                    firstName: "Кристина",
                    secondName: "Евдокимовна",
                    middleName: "Алексеевна",
                    profession: "Педиатор",
                    photoProfile: "Kris",
                    category: "Врач высшей категории",
                    education: "1-й ММИ им. М.М.Сеченова",
                    placeWork: "Детская клиника РебёнОК"),
        
        DoctorModel(price: 350,
                    rating: 3.5,
                    experience: 8,
                    firstName: "Виктор",
                    secondName: "Суворов",
                    middleName: "Евгеньевич",
                    profession: "Педиатор",
                    photoProfile: "Vitek",
                    category: "Вторая категория",
                    education: "1-й ММИ им. М.М.Сеченова",
                    placeWork: "Детская клиника РебёнОК"),
    ]}
}

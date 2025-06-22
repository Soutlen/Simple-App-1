//
//  ProdileView.swift
//  10.10
//
//  Created by Евгений Глоба on 5/31/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading) {
                            Text("Пользователь")
                                .font(.headline)
                            Text(viewModel.userEmail)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                Section("Личные данные") {
                    NavigationLink("Редактировать профиль") {
                        Text("Редактирование профиля")
                    }
                    
                    NavigationLink("История записей") {
                        ReceptionView()
                    }
                }
                
                Section {
                    Button("Выйти") {
                        viewModel.logout()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Профиль")
            .fullScreenCover(isPresented: $viewModel.navigateToAuth) {
                AuthView()
            }
        }
    }
}

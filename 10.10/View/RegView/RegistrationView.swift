//
//  RegistrationView.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Регистрация")
                .font(.title)
                .padding(.top, 50)
            
            VStack(spacing: 15) {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity)
                
                SecureField("Пароль", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)
                
                SecureField("Подтвердите пароль", text: $viewModel.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)
                
                if viewModel.showError {
                    Text("Пароли не совпадают")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding(.horizontal)
            
            Button("Зарегистрироваться") {
                viewModel.register()
            }
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 47)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
            
            Spacer()
            
            Button("Уже есть аккаунт? Войти") {
                viewModel.showAuth = true
            }
            .foregroundColor(.blue)
            .padding(.bottom)
        }
        .fullScreenCover(isPresented: $viewModel.isRegistered) {
            ContentView()
        }
        .fullScreenCover(isPresented: $viewModel.showAuth) {
            AuthView()
        }
    }
}

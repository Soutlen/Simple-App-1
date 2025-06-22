//
//  AuthView.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//
import SwiftUI

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Авторизация")
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
                
                if viewModel.showError {
                    Text("Неверные данные")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 10) {
                Button("Войти") {
                    viewModel.login()
                }
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 47)
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                Spacer()
                
                Button("Нет аккаунта? Зарегистрироваться") {
                    viewModel.showRegistration = true
                }
                .foregroundColor(.blue)
            }
        }
        .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
            ContentView()
        }
        .fullScreenCover(isPresented: $viewModel.showRegistration) {
            RegistrationView()
        }
    }
}

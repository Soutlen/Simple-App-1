//
//  StartView.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//

//import SwiftUI
//
//struct StartView: View {
//    @State private var showRegistration = false
//    @State private var showAuth = false
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                Text("Добро пожаловать!")
//                    .font(.title)
//                    .padding(.top, 50)
//                
//                Spacer()
//                
//                VStack(spacing: 15) {
//                    Button("Зарегистрироваться") {
//                        showRegistration = true
//                    }
//                    .font(.system(size: 15, weight: .medium))
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity, minHeight: 47)
//                    .background(Color.blue)
//                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                    
//                    Button("Войти") {
//                        showAuth = true
//                    }
//                    .font(.system(size: 15, weight: .medium))
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity, minHeight: 47)
//                    .background(Color.pink)
//                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                }
//                .padding(.horizontal)
//                
//                Spacer()
//            }
//            .navigationDestination(isPresented: $showAuth) {
//                AuthView()
//            }
//            .navigationDestination(isPresented: $showRegistration) {
//                RegistrationView()
//            }
//        }
//    }
//}

//
//  RegistrationViewModel.swift
//  10.10
//
//  Created by Евгений Глоба on 6/2/25.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showError = false
    @Published var isRegistered = false
    @Published var showAuth = false
    
    private let userManager = UserManager.shared
    
    func register() {
        if validateInput() {
            if userManager.register(email: email, password: password) {
                isRegistered = true
                showError = false
            }
        } else {
            showError = true
        }
    }
    
    func validateInput() -> Bool {
        return !email.isEmpty && !password.isEmpty && password == confirmPassword
    }
}

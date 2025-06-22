//
//  AuthViewModel.swift
//  10.10
//
//  Created by Евгений Глоба on 6/2/25.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false
    @Published var isLoggedIn = false
    @Published var showRegistration = false
    
    private let userManager = UserManager.shared
    
    func login() {
        if userManager.login(email: email, password: password) {
            isLoggedIn = true
            showError = false
        } else {
            showError = true
        }
    }
    
    func validateInput() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
}


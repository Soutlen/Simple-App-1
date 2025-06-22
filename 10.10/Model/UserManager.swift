//
//  UserManager.swift
//  10.10
//
//  Created by Евгений Глоба on 6/1/25.
//

import Foundation

class UserManager: ObservableObject {
    static let shared = UserManager()
    
    @Published var currentUser: User?
    
    private init() {}
    
    func login(email: String, password: String) -> Bool {
        if email == "test@test.com" && password == "123456" {
            currentUser = User(email: email)
            return true
        }
        return false
    }
    
    func register(email: String, password: String) -> Bool {
        currentUser = User(email: email)
        return true
    }
    
    func logout() {
        currentUser = nil
    }
 }

struct User {
    let email: String
}

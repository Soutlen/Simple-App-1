//
//  ProfileViewModel.swift
//  10.10
//
//  Created by Евгений Глоба on 6/2/25.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var navigateToAuth = false
    
    private let userManager = UserManager.shared
    
    var currentUser: User? {
        userManager.currentUser
    }
    
    var userEmail: String {
        currentUser?.email ?? " "
    }
    
    func logout() {
        userManager.logout()
        navigateToAuth = true
    }
}

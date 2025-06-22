//
//  ContentView.swift
//  10.10
//
//  Created by Евгений Глоба on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            ReceptionView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Reception")
                }
                .tag(1)
            
            ChatView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        }
    }
}


#Preview {
    RegistrationView()
}


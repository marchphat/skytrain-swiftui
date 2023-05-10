//
//  Test.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 11/5/2566 BE.
//

import SwiftUI

enum testViewState {
    case home
    case settings
    case profile
}

struct ContentView: View {
    
    @State private var testViewState: testViewState = .home
    
    var body: some View {
        VStack {
            switch testViewState {
            case .home:
                HomView()
            case .settings:
                SettingsView()
            case .profile:
                ProfileView()
            }
            HStack {
                Button(action: {
                    testViewState = .home
                }) {
                    Text("Home")
                }
                Button(action: {
                    testViewState = .settings
                }) {
                    Text("Settings")
                }
                Button(action: {
                    testViewState = .profile
                }) {
                    Text("Profile")
                }
            }
        }
    }
}

struct HomView: View {
    var body: some View {
        Text("Home View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

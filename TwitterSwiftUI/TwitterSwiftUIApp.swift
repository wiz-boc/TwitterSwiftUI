//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by wizz on 7/23/22.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
               ContentView()
               //ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
        }
    }
}

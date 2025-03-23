//
//  XplatformApp.swift
//  Xplatform
//
//  Created by Nail Babazade on 23.03.25.
//

import SwiftUI
import Firebase



@main
struct XplatformApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}

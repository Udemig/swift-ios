//
//  SwiftUI_ders01App.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 1.03.2025.
//

import SwiftUI


@main
struct SwiftUI_ders01App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDeelgate
    
    var body: some Scene {
        WindowGroup {
            Ders15()
        }
    }
}

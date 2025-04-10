//
//  Ders15.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import SwiftUI
import UserNotifications

struct Ders15: View {
    var body: some View {
        VStack{
            Button("Bildirim izni iste") {
                bildirimIzniIste()
            }
            .padding()
            
            Button("Bildirim gonder 1 2") {
                bildirimGonder()
            }
            .padding()
        }
    }
    
    func bildirimIzniIste() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { izinli, hata in
            if let hata = hata {
                print("izinde hata oldu \(hata.localizedDescription)")
            } else {
                print(izinli ? "izin verildi": "izin verilmedi")
            }
        }
    }
    
    func bildirimGonder() {
        let content = UNMutableNotificationContent()
        content.title = "merhaba"
        content.body = "Isvece gelmek ister misin?"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { hata in
            if let hata = hata {
                print("hata oldu \(hata.localizedDescription)")
            } else {
                print("bildirim gonderildi")
            }
        }
    }
}

#Preview {
    Ders15()
}

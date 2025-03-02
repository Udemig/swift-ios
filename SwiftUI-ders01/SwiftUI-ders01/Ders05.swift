//
//  Ders05.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI

struct Ders05: View {
    
    @State var kullaniciAdi: String = ""
    @State var adSoyad: String = ""
    @State var ulke: String = ""
    
    @State var ara: String = ""
    
    var body: some View {
        
        NavigationStack{
            Form{
                TextField("kullanici adi", text: $kullaniciAdi)
                TextField("Ad soyad", text: $adSoyad)
                TextField("ulke", text: $ulke)
                Button("Gonder"){
                    print("bilgiler gonderildi")
                }
            }.navigationTitle("Kullanici bilgileri")
            Grid{
                GridRow{
                    Text("Busra")
                    Text("Yilmaz")
                    Text("Konya")
                }
                GridRow{
                    Text("Nail")
                    Text("babazade")
                    Text("baku")
                }
                GridRow{
                    Text("memo can")
                    Text("seyhan")
                    Text("stockholm")
                }
            }
        }.searchable(text: $ara)
     
    }
}

#Preview {
    Ders05()
}

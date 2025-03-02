//
//  Ders09.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI

struct Ders09: View {
    @State var tarih =  Date()
    let elements = ["Sohan", "Mohan", "Monika", "Sona", "Mona", "Seemran"]
    
    var body: some View {
        VStack {
            DatePicker("tarih Sec", selection: $tarih, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .padding()
            
            List(elements, id: \.self) { deger in
                
                Text(deger)
            }
            List{
                DisclosureGroup("Ogrenciler"){
                    Text("memo")
                    Text("can")
                    Text("seyhan")
                }
            }
            List{
                Section("Ulkeker"){
                    Text("Isvec")
                    Text("Turkiye")
                    Text("Norvex")
                }
            }.listStyle(.grouped)
                .lineSpacing(15.2)
                .listRowSpacing(3)
                .listRowSeparator(.hidden)
        }
        
        
    }
}

#Preview {
    Ders09()
}

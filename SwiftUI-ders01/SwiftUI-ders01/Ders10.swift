//
//  Ders10.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI

struct Ders10: View {
    @State var elements = ["Python", "C++", "Swift", "C", "Java"]

    var body: some View {
        VStack{
            Text("Ayarlar")
            List{
                Section{
                    Text("wifi")
                    Text("mobil network")
                    Text("bluetooth")
                }header: {
                    Text("Baglantilar")
                }footer: {
                    Text("Tum ayar secenekleri")
                }
               
            }
            List {
                ForEach(elements, id: \.self) { dil in
                    Text(dil)
                }.onDelete(perform: elemanSil)
            }
            .padding()
            Spacer()
        }
    }
    func elemanSil(sirasi: IndexSet) {
        elements.remove(atOffsets: sirasi)
    }
}

#Preview {
    Ders10()
}

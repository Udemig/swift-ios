//
//  Ders12.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import SwiftUI

struct Ders12: View {
    
    @State var language: [String] = ["JS","Java","Swift","Kotlin","Flutter"]
  
    @State var isim: String = ""
    @State var uyari: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(language, id: \.self) { x in
                    Text(x)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.white)
                        .foregroundStyle(.pink)
                        .cornerRadius(10)
                        .draggable(x)
                }
                
                
                TextField("Adinizi girin", text: $isim)
                Button("Bana tikla") {
                    uyari = true
                }
                .clipShape(Rectangle())
                .background(.gray)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .alert("Uyari", isPresented: $uyari) {
                    Button("Tamam", role: .cancel){}
                    Button("Kayit ol", role: .none){}
                }message: {
                    Text("Lutfen dikkat ediniz")
                }
                
                Group{
                    Text("Swiftui dekratiftir")
                    Text("Ayrica cesifli duzenleyiciler saglar")
                    Text("Kullanilmasi kolaydir")
                }
                .font(.headline).foregroundStyle(.red.opacity(5.2))
                
            }
            .padding()
        }
    }
}

#Preview {
    Ders12()
}

//
//  Ders06.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI

struct Ders06: View {
    
    @State var toogleDeger1 = false
    @State var toogleDeger2 = false
    
    var body: some View {
        GeometryReader { myGeometry in
            VStack{
                HStack {
                    Text("Ana elamam genisligi: ")
                    Spacer()
                    Text("\(myGeometry.size.width)")

                }.padding()
                HStack{
                    Text("Ana elamam genisligi")
                    Spacer()
                    Text("\(myGeometry.size.height)")
                }.padding([.trailing, .leading], 40)
                
             
                
                Rectangle().fill(.mint)
                    .frame(width: myGeometry.size.width/2, height: myGeometry.size.height/2)
                Toggle("Bildirimler", isOn: $toogleDeger1)
                Toggle("Alt Bildirimler", isOn: $toogleDeger2)

            }
        }
    }
}

#Preview {
    Ders06()
}

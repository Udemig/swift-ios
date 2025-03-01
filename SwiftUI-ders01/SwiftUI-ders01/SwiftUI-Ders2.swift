//
//  SwiftUI-Ders2.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 1.03.2025.
//

import SwiftUI

struct Karem: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct SwiftUI_Ders2: View {
    @State private var adi: String = "" //mehmet can seyhan
    @State var rengim: Color  = .yellow
    var body: some View {
        VStack {
            TextField("Adiniz Gir", text: $adi)
            Text("Girilen ad \(adi)")
            ColorPicker("Renk Sec", selection: $rengim)
            Karem()
                .fill(.green)
                .frame(width: 100, height: 100)
            Ellipse()
                .frame(width: 50, height: 50)
                .background(rengim)
                .padding()
            Capsule()
                .frame(width: 50, height: 50)
            Text("Busra mehrbaba bugun neler yaptin bize bol bol ")
                .underline(color: .red)
                .strikethrough()
                .lineLimit(2)
                .border(.orange)
                .tracking(4.0)
                .opacity(0.7)
            
            Button("Bana tikla"){
                //burasi calisir
            }
            Rectangle()
                .frame(width: 150, height: 190)
                .overlay {
                    List{
                        Text("memo")
                        Text("Can")
                        Text("seyhan")
                    }
                }
        }
        .padding()
    }
}

#Preview {
    SwiftUI_Ders2()
}

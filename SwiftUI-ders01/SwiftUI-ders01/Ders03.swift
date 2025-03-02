//
//  Ders03.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI

struct Ders03: View {
    var body: some View {
        List{
            ZStack {
                Image("resim2")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Rectangle())
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .blendMode(.darken)
                    .opacity(0.5)
                    .background(
                        Image("resim2").ignoresSafeArea()
                    )
            }
            .shadow(radius: 5, x:-20.0, y:-10.0)
            .onTapGesture {
                print("BOOM")
            }
            
            ZStack {
                Image("resim2")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .blendMode(.screen)
                    
            }
            .defaultHoverEffect(.automatic)

            
            ZStack {
                Image("resim2")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Rectangle())
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .blendMode(.colorBurn)
            }
            
            ZStack {
                Image("resim2")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Rectangle())
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .blendMode(.hardLight)
            }
            
            
            Rectangle()
                .fill(LinearGradient(colors: [.red, .blue, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 170, height: 150)
                .padding(20)
                .colorMultiply(.pink)
                .brightness(0.8)
                .rotationEffect(.degrees(70))

            Rectangle()
                .fill(RadialGradient(colors: [.mint, .pink], center: .center, startRadius: 0, endRadius: 150))
                .frame(width: 170, height: 150)
                .padding(20)
                .saturation(6.0)
                .hueRotation(Angle(degrees: 75))
                .scaleEffect(1.2)
            
            Rectangle()
                .fill(AngularGradient(colors: [.red, .green, .blue], center: .center))
                .frame(width: 200, height: 200)
                .padding(20)
                .contrast(5.0)
                .blur(radius: 12)
            
        }
    }
}

#Preview {
    Ders03()
}

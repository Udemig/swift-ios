//
//  ContentView.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 1.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State var scale = false // true
    @State var color = false // true
    @State var move = false
    
    var body: some View {
        List {
            RoundedRectangle(cornerRadius: 5)
                .fill(color ? .mint : .red)
                .scaleEffect(scale ? 1.7 : 1.1)
                .frame(width: 150, height: 100)
            Button("Tikla"){
                withAnimation(.easeInOut(duration: 2.0)) {
                    scale.toggle()
                    withAnimation(.easeInOut(duration: 1.0)) {
                        color.toggle()
                    }
                }
            }
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.red)
                
            Text("Hello, world!")
                .font(.largeTitle)
                .background(.red)
                .foregroundStyle(.white)
                .cornerRadius(8)
            Text("Mehmet can seyhan")
            HStack {
                Rectangle().fill(.mint)
                    .frame(width: 50, height: 50)
                    .offset(x: move ? 100 : -10)
                    .animation(.timingCurve(0.67, -0.54, 0.28, 1.34, duration: 2), value: move)
                Button("Tikla"){
                    move.toggle()
                }
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                    .padding(8)
                    .overlay {
                        Text("3")
                            .foregroundStyle(.red)
                    }
            }
            .padding()
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                Rectangle()
                    .fill(.green)
                    .frame(height: 100)
                    .padding()
                Text("Nasilsiniz?")
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .fill(.yellow)
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 50)
                    
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

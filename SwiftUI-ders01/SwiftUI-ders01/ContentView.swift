//
//  ContentView.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 1.03.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
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

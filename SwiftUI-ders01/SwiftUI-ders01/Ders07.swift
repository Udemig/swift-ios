//
//  Ders07.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI

struct Ders07: View {
    @State var toggleDeger1 = false
    @State var toggleDeger2 = false
    @State var toggleDeger3 = false
    
    @State var deger1: Double = 5
    @State var deger2: Bool = true
    
    var body: some View {
        
        
        NavigationView {
            List{
                Text("SwiftUI")
                VStack {
                    
                    Text("Select your gender:").font(.headline)
                    Toggle("Male", isOn: $toggleDeger1)
                        .toggleStyle(checkBoxStyle())
                        .foregroundStyle(.red)
                    Toggle("Female", isOn: $toggleDeger2)
                        .toggleStyle(checkBoxStyle())
                        .padding(.leading, 20)
                        .foregroundStyle(.green)
                    Toggle("TransGender", isOn: $toggleDeger3)
                        .toggleStyle(checkBoxStyle())
                        .padding(.leading, 69)
                    Slider(value: $deger1, in: 0...10)

                }
                
            }.navigationTitle("Ust kisim")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            print("tiklanildi")
                        } label: {
                            Image(systemName: "plus").font(.largeTitle)
                        }.background(.blue).foregroundStyle(.white)
                        
                        
                    }
                    
                
                    
                  
                }
            
            
            
            
        }
    }
}

struct checkBoxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack{
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width:26, height:26)
                .onTapGesture {configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}


#Preview {
    Ders07()
}

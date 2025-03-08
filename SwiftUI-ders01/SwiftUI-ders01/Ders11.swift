//
//  Ders11.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import SwiftUI

struct Student: Identifiable {
    let name: String
    let id = UUID()
    let age: Int
    let subject: String
}

struct Ders11: View {
    
    @State var stud = [
        Student(name: "Busra", age: 30, subject: "Mat"),
        Student(name: "Nail", age: 25, subject: "Bilim"),
        Student(name: "Memo", age: 30, subject: "Yazilim"),
        Student(name: "Hatice", age: 30, subject: "Fizik")
    ]
    @State var yazim: String = "selam"
    @State var gorunum: Bool = true
    
    @State var position = CGSize.zero
    @State var dragOffsetValue = CGSize.zero
    
    var body: some View {
        VStack {
            Text("Orijinal Tablo").font(.title2)
            Table(stud) {
                TableColumn("Ogrenci adi", value: \.name)
                
            }.tableStyle(.inset)
                
            
            Circle()
                .fill(.mint)
                .frame(width: 100)
                .offset(x: position.width + dragOffsetValue.width, y: position.height + dragOffsetValue.height )
                .gesture(
                    DragGesture()
                        .onChanged({ g in
                            dragOffsetValue = g.translation
                        })
                        .onEnded({ _ in
                            position.width += dragOffsetValue.width
                            position.height += dragOffsetValue.height
                            dragOffsetValue = .zero
                        })
                ).animation(.easeIn, value: position)
            
            if gorunum {
                Text(yazim)
                    .font(.title2)
                    .padding()
                    .onAppear {
                        print("Yazi gorundu")
                        yazim = "Hosgeldinizzzz"
                    }
                    .onDisappear {
                        print("Yazi kalkti")
                        yazim = "Bulunamiyor"
                    }
                    .onTapGesture {
                        print("yaziya dokundun")
                        
                    }
                    
                
            }
            Button("Degistir") {
                gorunum.toggle()
                UIPasteboard.general.string = yazim
                print("yazi kopyalandi")
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    Ders11()
}

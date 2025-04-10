//
//  Ders08.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI

struct ProgrammingLanguage: Identifiable {
    let id = UUID()
    let name: String
}



struct Ders08: View {
    @State var aranilanVeri: String = ""
    @State var olmayanDil: String = ""
    @State var secilenEleman: String = "Ac"
    
    let lang: [ProgrammingLanguage] = [
          ProgrammingLanguage(name: "C"),
          ProgrammingLanguage(name: "C++"),
          ProgrammingLanguage(name: "Java"),
          ProgrammingLanguage(name: "Python"),
          ProgrammingLanguage(name: "C#"),
          ProgrammingLanguage(name: "Swift"),
          ProgrammingLanguage(name: "Go"),
          ProgrammingLanguage(name: "Ruby"),
          ProgrammingLanguage(name: "Scala"),
          ProgrammingLanguage(name: "JavaScript"),
          ProgrammingLanguage(name: "JQuery"),
          ProgrammingLanguage(name: "Objective-C")
       ]
    
    var body: some View {
        NavigationStack{
            List{
                Picker("bir secenek sec", selection: $secilenEleman){
                    ForEach(lang.filter{ aranilanVeri.isEmpty || $0.name.localizedCaseInsensitiveContains(aranilanVeri)}) { dil in
                        Text(dil.name)
                            .onTapGesture {
                                tiklanildi(eleman: dil.name)
                            }
                    }
                }.pickerStyle(.wheel)

            }.navigationTitle("Programlama dilleri")
                .cornerRadius(10)
                .shadow(radius: 10)
            TextField("Aradigin dil yoksa yaz", text: $olmayanDil)
                .padding()
                .textInputAutocapitalization(.characters)
            Spacer()
        }.searchable(text: $aranilanVeri)
    }
    
    func tiklanildi(eleman: String) {
        
        print("tiklanildi: \(eleman)")
    }
}

#Preview {
    Ders08()
}

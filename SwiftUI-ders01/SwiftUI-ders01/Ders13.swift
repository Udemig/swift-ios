//
//  Ders13.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import SwiftUI


struct Ders13: View {
    
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack{
            Text("Sayax: \(viewModel.sayac)")
                .font(.largeTitle)
                .padding()
            
            Button("Sayac sifitla") {
                viewModel.sayac = 0
                viewModel.sayacDurdur()
            }
            .padding()
        }
    }
}

#Preview {
    Ders13()
}

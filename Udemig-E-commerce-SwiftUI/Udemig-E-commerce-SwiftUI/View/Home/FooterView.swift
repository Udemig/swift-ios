//
//  FooterView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 22.03.2025.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Biz en iyi kasklari ve enuygun fiyata olanlari size sunuyoruz")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundStyle(.gray)
                .layoutPriority(0)
            
            Text("Tum haklar @ Mehmet Can Seyhan\n Tarafindan saklidir")
        }
        .padding()
    }
}

#Preview {
    FooterView()
}

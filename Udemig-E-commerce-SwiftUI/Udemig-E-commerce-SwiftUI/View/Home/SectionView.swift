//
//  SectionView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import SwiftUI

struct SectionView: View {
    //MARK: -Property
    @State var rotateClockWise: Bool
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            
            Text("Kategoriler".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateClockWise ? 90 : -90))
            
            Spacer()
        }
        .background(colorGray)
        .cornerRadius(12)
        .frame(width: 85)
    }
}

#Preview {
    SectionView(rotateClockWise: true)
}

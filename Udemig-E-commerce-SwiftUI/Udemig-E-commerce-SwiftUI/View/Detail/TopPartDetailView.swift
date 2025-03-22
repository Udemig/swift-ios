//
//  TopPartDetailView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 22.03.2025.
//

import SwiftUI

struct TopPartDetailView: View {
    //MARK: -Property
    @EnvironmentObject var shop: Shop
    @State private var isAnimating: Bool = false
    
    //MARK: -Body
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Fiyat")
                    .fontWeight(.semibold)
                
                Text(shop.selectedProduct?.formattedPrice ?? sampleProduct.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            } .offset(y: isAnimating ? -50: -75)
            Spacer()
      
       
        
        Image(shop.selectedProduct?.image ?? sampleProduct.image)
            .resizable()
            .scaledToFit()
            .offset(y: isAnimating ? 0 : -35)
            
        }.onAppear {
            withAnimation(.easeInOut(duration: 0.75)) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    TopPartDetailView()
        .environmentObject(Shop())
}

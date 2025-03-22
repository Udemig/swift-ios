//
//  AddToCartDetailView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 22.03.2025.
//

import SwiftUI

struct AddToCartDetailView: View {
    //MARK: Property
    @EnvironmentObject var shop: Shop
    
    //MARK: -Body
    var body: some View {
        Button {
            feedback.impactOccurred()
        } label: {
            Spacer()
            Text("Sepete Ekle".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(15)
        .background(
            Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                  green: shop.selectedProduct?.green ?? sampleProduct.green,
                  blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
        )
        .clipShape(Capsule())

    }
}

#Preview {
    AddToCartDetailView()
        .environmentObject(Shop())
}

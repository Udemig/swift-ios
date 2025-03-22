//
//  HeaderDetailView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 22.03.2025.
//

import SwiftUI

struct HeaderDetailView: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Yumusatici kask")
            
            Text(shop.selectedProduct?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .foregroundColor(.white)
    }
}

#Preview {
    HeaderDetailView()
        .environmentObject(Shop())
        .background(.gray)
}

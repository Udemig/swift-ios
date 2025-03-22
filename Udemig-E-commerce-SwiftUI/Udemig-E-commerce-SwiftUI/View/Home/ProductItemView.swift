//
//  ProductItemVıew.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 22.03.2025.
//

import SwiftUI

struct ProductItemView: View {
    
    //MARK: -Property
    
    let product: Product
    
    //MARK: -BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack{
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(6)
            }
            .background(Color(red: product.red, green: product.green, blue: product.blue))
            .cornerRadius(12)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ProductItemView(product: products[0])
}

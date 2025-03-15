//
//  BrandItemView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import SwiftUI

struct BrandItemView: View {
    //MARK: Property
    let brand: Brand
    
    //MARK: -Body
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding(3)
            .background(.white)
            .cornerRadius(12)
            .background(
            RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1)
        )
    }
}

#Preview {
    BrandItemView(brand: brands[0])
}

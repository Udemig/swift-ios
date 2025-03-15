//
//  BrandGridView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import SwiftUI

struct BrandGridView: View {
    
    //MARK: -Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout,spacing: columnSpacing) {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            }
            .frame(height: 200)
            .padding(15)
        }
    }
}

#Preview {
    BrandGridView()
}

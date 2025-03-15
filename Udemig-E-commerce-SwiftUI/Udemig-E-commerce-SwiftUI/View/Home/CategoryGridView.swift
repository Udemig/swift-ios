//
//  CategoryGridView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import SwiftUI

struct CategoryGridView: View {
    
    //MARK: -Body
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                Section(header: SectionView(rotateClockWise: false), footer: SectionView(rotateClockWise: true)) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            }
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    CategoryGridView()
}

//
//  CategoryItemView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import SwiftUI

struct CategoryItemView: View {
    
    //MARK: Property
    let category: Category
    
    //MARK: -Body
    var body: some View {
        Button(action: {}) {
            HStack(alignment: .center, spacing: 6) {
                Image(category.image)
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                
                Spacer()
            }
            .padding()
            .background(.white)
            .cornerRadius(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            )
        }
    }
}

#Preview {
    CategoryItemView(category: categories[0])
}

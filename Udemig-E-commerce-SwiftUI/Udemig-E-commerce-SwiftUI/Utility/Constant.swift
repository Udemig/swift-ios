//
//  Constant.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import Foundation
import SwiftUI

//DATA
let players:[Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products:[Product] = Bundle.main.decode("product.json")
let brands:[Brand] = Bundle.main.decode("brand.json")

let sampleProduct: Product = products[0]

//Color

let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(.systemGray4)

//Layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout:[GridItem]{
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}


//UX

let feedback = UIImpactFeedbackGenerator(style: .medium)



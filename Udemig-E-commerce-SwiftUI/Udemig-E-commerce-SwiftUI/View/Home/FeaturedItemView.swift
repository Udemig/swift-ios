//
//  FeaturedItemView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import SwiftUI

struct FeaturedItemView: View {
    
    //MARK: -Property
    let player: Player
    
    //MARK: -Body
    var body: some View {
        Image(player.image)
            .resizable()
            .scaleEffect()
            .cornerRadius(12)
    }
}

#Preview {
    FeaturedItemView(player: players[0])
}

//
//  LogoView.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import SwiftUI

struct LogoView: View {
    
    //MARK: -Body
    var body: some View {
        HStack(spacing: 4){
            Text("Asagi".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image("logo-dark")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("Tikla".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    LogoView()
}

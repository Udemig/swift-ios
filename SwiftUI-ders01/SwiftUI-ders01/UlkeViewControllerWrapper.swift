//
//  UlkeViewControllerWrapper.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import Foundation
import SwiftUI
import UIKit

struct UlkeViewControllerWrapper: UIViewControllerRepresentable {
   
    func makeUIViewController(context: Context) -> some UIViewController {
        return UlkeViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //guncelle yapabilirsin
    }
    
}

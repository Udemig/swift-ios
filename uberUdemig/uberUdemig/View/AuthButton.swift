//
//  AuthButton.swift
//  udeUber
//
//  Created by Mehmet Seyhan on 21.12.2024.
//

import Foundation
import UIKit

class AuthButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = .mainBlueTint
        setTitleColor(.white, for: .normal)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) uygulanamadi")
    }
}

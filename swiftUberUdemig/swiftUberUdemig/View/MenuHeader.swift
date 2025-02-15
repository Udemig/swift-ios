//
//  MenuHeader.swift
//  swiftUberUdemig
//
//  Created by Mehmet Seyhan on 15.02.2025.
//

import Foundation
import UIKit

class MenuHeader: UIView{
    
    //MARK: -properties
    private let user: User
    
    private lazy var profileImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.addSubview(initialLabel)
        initialLabel.centerX(inView: view)
        initialLabel.centerY(inView: view)
        return view
    }()
    
    private lazy var initialLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 42)
        label.textColor = .white
        label.text = user.firstInitial
        return label
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.text = user.fullname
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = user.email
        return label
    }()
    
    let pickupModeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 1.0, alpha: 0.9)
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var pickupModeSwitch: UISwitch = {
        let s = UISwitch()
        s.isOn = true
        s.tintColor = .white
        s.onTintColor = .mainBlueTint
        s.addTarget(self, action: #selector(handlePickupModeChanged), for: .valueChanged)
        return s
    }()
    
    
    init(user: User, frame: CGRect) {
        self.user = user
        super.init(frame: frame)
        
        backgroundColor = .backgroundColor
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 12, width: 64, height: 64)
        profileImageView.layer.cornerRadius = 64 / 2
        
        let stack = UIStackView(arrangedSubviews: [fullnameLabel, emailLabel])
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .vertical
        
        addSubview(stack)
        
        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
        
        configureSwitch(enabled: true)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureSwitch(enabled: Bool){
        if user.accountType == .driver {
            addSubview(pickupModeLabel)
            pickupModeLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingBottom: 12, paddingRight: 16)
            
            addSubview(pickupModeSwitch)
            pickupModeSwitch.anchor(top: pickupModeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 16)
            pickupModeSwitch.isOn = enabled
            pickupModeLabel.text = enabled ? "Almam modu aktif": "Alma modu aktif degil"
        }
    }
    
    @objc func handlePickupModeChanged(){
        
    }
    
}

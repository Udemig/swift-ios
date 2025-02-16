//
//  LocationInputActivationView.swift
//  swiftUberUdemig
//
//  Created by Mehmet Seyhan on 16.02.2025.
//

import Foundation
import UIKit

protocol LocationInputActivationViewDelegate {
    func presentLocationInputView()
}

class LocationInputActivationView: UIView {
    
    
    //MARK: - Properties
    var delegate: LocationInputActivationViewDelegate?
    
    let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.text = "Nereye?"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    func configureUI() {
        backgroundColor = .white
        addShadow()
        
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(height: 6, width: 6)
        
        addSubview(placeHolderLabel)
        placeHolderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
    }
    
    func configureGectureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleViewTapped))
        addGestureRecognizer(tap)
    }
    
    //MARK: - selectors
    @objc func handleViewTapped(){
        delegate?.presentLocationInputView()
    }
    
    
}


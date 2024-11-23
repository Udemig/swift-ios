//
//  ViewController.swift
//  ders01
//
//  Created by Mehmet Seyhan on 23.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //view
    var aView: UIView = {
        let bView = UIView()
        bView.backgroundColor = .green
        bView.layer.cornerRadius = 10
        
        //automatik yerlesme ben yapacam
        bView.translatesAutoresizingMaskIntoConstraints = false

        return bView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
        setConstraints()
    }

    func setConstraints() {
        self.view.addSubview(aView)
        
        NSLayoutConstraint.activate([
            aView.widthAnchor.constraint(equalToConstant: 100),
            aView.heightAnchor.constraint(equalToConstant: 200),
            aView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            aView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }
    
    /*
     Elinizde bir label olsun kod ile olusturun. Icine adinizi yaziniz.
     Onu yesil olan view in altina yerlestirin. Ikisinin sola yaslamasi ayni olsun.
     
     */

}


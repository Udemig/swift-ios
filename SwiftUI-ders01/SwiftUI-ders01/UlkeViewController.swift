//
//  UlkeViewController.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import UIKit

class UlkeViewController: UIViewController {
    

    var selamlarLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.backgroundColor = .white
        label.text = "merhaba ben uikit ile olusturuldum ve uicontroller icindeyim"
        label.numberOfLines = 4
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        
        view.addSubview(selamlarLabel)
        selamlarLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selamlarLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selamlarLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            selamlarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            selamlarLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  DetayViewController.swift
//  ders01
//
//  Created by Mehmet Seyhan on 23.11.2024.
//

import UIKit

class DetayViewController: UIViewController {

    var karsilamaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var isim: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    
    func setupUI() {
        view.backgroundColor = .cyan
        
        self.view.addSubview(karsilamaLabel)
        karsilamaLabel.text = "Hosgeldin \(isim)"
        karsilamaLabel.backgroundColor = .blue
        karsilamaLabel.textColor = .red
        karsilamaLabel.layer.cornerRadius = 10
        karsilamaLabel.clipsToBounds = true


        
        NSLayoutConstraint.activate([
            karsilamaLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            karsilamaLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            karsilamaLabel.heightAnchor.constraint(equalToConstant: 50)
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

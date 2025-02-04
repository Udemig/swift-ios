//
//  DetailViewController.swift
//  arayuzornek2
//
//  Created by Mehmet Seyhan on 16.11.2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var karsilamaLabel: UILabel!
    
    var gelenIsim: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        karsilamaLabel.text = "Hosgeldin \(gelenIsim)"
        // Do any additional setup after loading the view.
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

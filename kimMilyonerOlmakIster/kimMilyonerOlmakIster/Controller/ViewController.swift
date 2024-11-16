//
//  ViewController.swift
//  kimMilyonerOlmakIster
//
//  Created by Mehmet Seyhan on 16.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yanlisBtn: UIButton!
    @IBOutlet weak var dogruBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var soruLabel: UILabel!
    @IBOutlet weak var sonucLabel: UILabel!
    
    
    var soruHavuzu = SoruHavuzu()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arayuzuGuncelle()
    }
    
    @IBAction func cevapDugmesineTiklandi(_ sender: UIButton) {
        let kullaniciCevabi = sender.currentTitle!
        
        let kullaniciCevabiDogrumu = soruHavuzu.cevabiKontrolEt(kullaniciCevabi: kullaniciCevabi)
        
        if kullaniciCevabiDogrumu {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        soruHavuzu.siradakiSoru()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(arayuzuGuncelle), userInfo: nil, repeats: false)
        
    }
    
    
     @objc func arayuzuGuncelle() {
        soruLabel.text = soruHavuzu.soruyuAl()
        progressBar.progress = soruHavuzu.ilerlemeCubuguAl()
        sonucLabel.text = "Sonuc: \(soruHavuzu.sonucuAl())"
        
        yanlisBtn.backgroundColor = .clear
        dogruBtn.backgroundColor = .clear
    }


}


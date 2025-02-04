//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mehmet Seyhan on 17.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sehirAdiLabel: UILabel!
    
    @IBOutlet weak var sehirAdiTextField: UITextField!
    @IBOutlet weak var gostergeActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var yagisLabel: UILabel!
    @IBOutlet weak var nemLabel: UILabel!
    @IBOutlet weak var bilgiLabel: UILabel!
    @IBOutlet weak var dereceLabel: UILabel!
    @IBOutlet weak var haveDurumuIcon: UIImageView!
    
    
    var jsonDownloader: JsonDownloader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initContent()
    }
    
    func initContent() {
        jsonDownloader = JsonDownloader()
        verileriAl()
    }

    func verileriAl() {
        
        jsonDownloader!.havaVerisiniAl { havaModel in
            print(havaModel)
            DispatchQueue.main.async {
                self.veriyiGoster(veri: havaModel)
            }
        }
    }
    
    func veriyiGoster(veri: HavaModel?) {
        bilgiLabel.text = veri?.weather[0].desc ?? "iyi"
        dereceLabel.text = veri?.main.temp.description ?? "20"
        nemLabel.text = veri?.main.humidity.description ?? "0"
        yagisLabel.text = veri?.wind.speed.description ?? "0"
        sehirAdiLabel.text = veri?.name ?? "Stockholm"
        gostergeActivityIndicator.stopAnimating()
    }
    
    @IBAction func yenileBtnTiklanildi(_ sender: UIButton) {
        if let sehirAdi = sehirAdiTextField.text {
            print("sehirAdi \(sehirAdi)")
            jsonDownloader!.sehirAdiAta(sehirAdi: sehirAdi)
            verileriAl()
        }
        
      /*
       Ekranda bunulan textField alanina bir sehir ismi girildiginde, o sehre ait havadurumu bilgilerini ekranda gosteriniz. Nor en az 3 bilgi olsun- openweatherapi kullanin
       
       */
    }
    

}


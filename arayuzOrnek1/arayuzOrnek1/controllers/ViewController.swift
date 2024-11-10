//
//  ViewController.swift
//  arayuzOrnek1
//
//  Created by Mehmet Seyhan on 10.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    @IBOutlet weak var isimlabel: UILabel!
    @IBOutlet weak var isimTextField: UITextField!
    
    @IBOutlet weak var tahminTextField: UITextField!
    
    @IBOutlet weak var tahminDurumLabel: UILabel!
    
    
    var hak = 1
    let rastgeleSayi = Int.random(in: 1...10)

    
    //Default - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemCyan
        print("rastgeleSayi: \(rastgeleSayi)")
    }

    //adi degistirme kismini yonetir
    @IBAction func adDegistirBtnTiklandi(_ sender: UIButton) {
        let isim = isimTextField.text
        isimlabel.text = isim
    }
    
    
    
    @IBAction func tahminYapTiklandi(_ sender: Any) {
        
        let kSayi = Int(tahminTextField.text!)!
      
        if (kSayi == rastgeleSayi){
            hak = 1
            tahminDurumLabel.text = "kazandiniz"
        } else{
            if(hak == 3){
                tahminDurumLabel.text = "kaybettiniz"
            }else{
                hak = hak + 1
                if (rastgeleSayi > kSayi){
                    tahminDurumLabel.text = "daha buyuk gir"
                } else {
                    tahminDurumLabel.text = "daha kucuk gir"
                }
            }
        }
        
    }
    /*
     2 adet textField tan alinan sayilarin toplamini yine ekranda yer alan label"a yazan bir code-script i yaziniz. Topla dugmesine tiklanildiginda bu islem meydana gelsin
     */
    
    /*
     Kullanicidan 2 adet farkli textfield dan alinan sayinin hangisinin buyuk oldugunu bulan bir ve bir label a yazan code-script yaziniz. Butona tiklanildiginda bu islem olsun &&
     */
    
    /*
     Bir kullanici rastgele bir sayi girmektedir. Makinada rastgele bir sayi uretmektedir. Eger bu sayilar esit ise ekrana kazandiniz , degilse kaybettiniz yazan bir code-script yaziniz
     let rastgeleSayi = Int.random(in: 1...10)
     
     Kullanicidan girdigi 2 adet sinavin aritmetik ortalamasini bulup ve eger 45 veya ustu ise gecti, degilse kaldi yazan bir code-script yaziniz.
     
     Kullanicidan alinan 2 adet sinavin aritmetik ortalamasini bulup eger 45 alti ise kaldi 45 ustu ise gecti ama hangi notla gectigini de belirtilen bir code-script yaziniz. 45-55 arasi CB  notu ile 55-70 arasi -BB 70-85 arasi BB ve 85 ustu ise AA ile gectigini belirtiniz
     
     
     Bir kullanici rastgele bir sayi girmektedir. Makinada rastgele bir sayi uretmektedir. Kullanicinin 3 hakki vardir. Eger bu sayilar esit ise ekrana kazandiniz, degilse ve hakki varsa kullanicinin daha buyuk veya daha kucuk sayi girmesi icinde cikti vereceginiz. Fakat 3 hakkinda da eger bilemezse ekrana kaybettiniz yazan bir code-script yaziniz.
     
     */
    
   
    
}


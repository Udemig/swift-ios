//
//  ViewController.swift
//  arayuzornek2
//
//  Created by Mehmet Seyhan on 16.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var isimTextField: UITextField!
    
    @IBOutlet weak var isimListesiTableView: UITableView!
    
    var isimler = ["bilal","ceylan","hatice","sabri","memo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isimListesiTableView.dataSource = self
        isimListesiTableView.delegate = self
        // Do any additional setup after loading the view.
        //
    }
    
    
    @IBAction func ekleBtnTiklanildi(_ sender: UIButton) {
        if let yeniAd = isimTextField.text {
            isimler.append(yeniAd)
            isimListesiTableView.reloadData()
            isimTextField.text = ""
        }
       
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCellIndentifier", for: indexPath) as! NameTableViewCell
        cell.isimLabel.text = isimler[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailStoryboardID") as? DetailViewController {
            detailVC.gelenIsim = isimler[indexPath.row]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        
        // performSegue(withIdentifier: "detailIdentifier", sender: nil)
    }
    
    /*
     
     Elinizde bir isim oluturma uygulamasi olsun. Veri giris alanindan kisiler adlarini yazip ekle tusuna bastikca onlar, tum isimler altta siralanacaktir. ve eger isimlerden birisine tiklanildiginda, diger detay sayfasina gidip hosgelsin "isim" seklinde karsilama olsun.
     */
    
    
}


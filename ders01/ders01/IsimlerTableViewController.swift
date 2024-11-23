//
//  IsimlerTableViewController.swift
//  ders01
//
//  Created by Mehmet Seyhan on 23.11.2024.
//

import UIKit

class IsimlerTableViewController: UIViewController  {

    
    var isimlerTablo: UITableView = {
        let tView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        tView.register(IsimlerTableViewCell.self, forCellReuseIdentifier: "isimlerimizCell")
        return tView
    }()
    
    var isimTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Lutfen isim giriniz"
        textField.translatesAutoresizingMaskIntoConstraints = false
      return textField
    }()
    
    var ekleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ekle", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.titleLabel?.textColor = .red
        return button
    }()
    
    var isimler = ["bilal","ceylan","memo","hatice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupUI()
        initTableContent()
    }
    
    func initTableContent() {
        isimlerTablo.delegate = self
        isimlerTablo.dataSource = self
    }
    
    @objc func isimEkle() {
        if let isim = isimTextField.text {
            isimler.append(isim)
            isimTextField.text = ""
            
            self.isimlerTablo.reloadData()
        }
    }
    
    func setupUI() {
        
        view.backgroundColor = .gray
        
        view.addSubview(isimlerTablo)
        view.addSubview(isimTextField)
        view.addSubview(ekleButton)
        
        ekleButton.addTarget(self, action: #selector(isimEkle), for: .touchUpInside)
        
        isimlerTablo.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            isimTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            isimTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            isimTextField.widthAnchor.constraint(equalToConstant: self.view.layer.frame.width / 2),
            
            ekleButton.leadingAnchor.constraint(equalTo: isimTextField.trailingAnchor, constant: 16),
            ekleButton.centerYAnchor.constraint(equalTo: isimTextField.centerYAnchor),
            ekleButton.widthAnchor.constraint(equalToConstant: 75),
          
            
            isimlerTablo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            isimlerTablo.topAnchor.constraint(equalTo: isimTextField.bottomAnchor, constant: 16),
            isimlerTablo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            isimlerTablo.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    /*
     elinizde bir textLabel olsun o alandan kisilerin adini alarak elinizdeki listeye ekleyin ve bu listeye tiklaninca detay sayfasinda hosgeldin kisi yazsin.
     
     */


}

extension IsimlerTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "isimlerimizCell") as! IsimlerTableViewCell
        cell.bagla(isim: isimler[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetayViewController()
        vc.isim = isimler[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//
//  ViewController.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 24.11.2024.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        let mail = mailTextField.text!
        let password = passwordTextField.text!
        
        if mail.isEmpty || password.isEmpty {
            Helper.dialogMessage(message: "Alanlar bos olamaz", vc: self)
            return
        }
        
        Auth.auth().signIn(withEmail: mail, password: password) { authDataResult, error in
            if error != nil {
                Helper.dialogMessage(message: (error?.localizedDescription)!, vc: self)
            } else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
                self.present(vc, animated: true)
            }
        }
        
    }
    
}


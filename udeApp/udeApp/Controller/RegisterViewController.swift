//
//  RegisterViewController.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 24.11.2024.
//

import UIKit
import PhotosUI
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth


class RegisterViewController: UIViewController, UINavigationControllerDelegate {
   
    

    @IBOutlet weak var nameAndSurnameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordRepetitionTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let action = UITapGestureRecognizer(target: self, action: #selector(openGalery))
        userImageView.addGestureRecognizer(action)
    }
    
    @objc func openGalery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func register(_ sender: Any) {
        let name = nameAndSurnameTextField.text!
        let mail = mailTextField.text!
        let password = passwordTextField.text!
        let passwordRepetition = passwordRepetitionTextField.text!
        
        if name.isEmpty || mail.isEmpty || password.isEmpty || passwordRepetition.isEmpty {
            Helper.dialogMessage(message: "Alanlar bos olamaz", vc: self)
            return
        }
        
        if self.userImageView.image == nil {
            Helper.dialogMessage(message: "Resim secmediniz", vc: self)
            return
        }
        
        if password != passwordRepetition {
            Helper.dialogMessage(message: "Sifreler ayni olmali", vc: self)
            return
        }
        
        let databaseRef = Database.database().reference()
        print("databaseRef \(databaseRef)")
        let storageRef = Storage.storage().reference()
        let auth = Auth.auth()
            
        auth.createUser(withEmail: mail, password: password) { (userData, error) in
            if error != nil {
                Helper.dialogMessage(message:  error!.localizedDescription, vc: self)
            } else {
                let imageName = UUID().uuidString + ".jpg"
                let path = "image"
                let imageRef = storageRef.child(path).child(imageName)
                imageRef.putData((self.userImageView.image?.jpegData(compressionQuality: 0.5))!) { metaData, error in
                    if error != nil {
                        Helper.dialogMessage(message: error!.localizedDescription, vc: self)
                    } else {
                        imageRef.downloadURL { url, error in
                            if error != nil {
                                Helper.dialogMessage(message: error!.localizedDescription, vc: self)
                            } else {
                                print(url?.absoluteString)
                                let userData = [
                                    "name": name,
                                    "mail": mail,
                                    "uid": auth.currentUser?.uid,
                                    "photoURL": url?.absoluteString
                                ]
                                databaseRef.child(Child.USERS).childByAutoId().setValue(userData) { error, databaseReference in
                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
                                    self.present(vc, animated: true)
                                }
                            }
                        }
                    }
                }
               
            }
        }
       
        
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


extension RegisterViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true, completion: nil)

            guard let firstResult = results.first else { return }
            if firstResult.itemProvider.canLoadObject(ofClass: UIImage.self) {
                firstResult.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            // Seçilen resmi burada kullan
                            self.userImageView.image = image
                        }
                    } else {
                        print("Resim yüklenemedi: \(String(describing: error))")
                    }
                }
            }
        }
}

//
//  ProfileViewController.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 30.11.2024.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getUserInfo()
    }
    
    func getUserInfo() {
        let databaseRef = Database.database().reference()
        let auth = Auth.auth()
        
        print("getUserInfo 1")
        databaseRef.child(Child.USERS)
            .queryOrdered(byChild: "uid")
            .queryEqual(toValue: auth.currentUser!.uid)
            .observeSingleEvent(of: .value) { dataSnopshot in
                for child in dataSnopshot.children{
                    print("getUserInfo 2")
                    let snap = child as! DataSnapshot
                    let userInfo = UserInfo(snapshot: snap)
                    print("getUserInfo 3")
                    
                    self.infoLabel.text = userInfo.name
                    Helper.imageLoad(imageView: self.photoImageView, url: userInfo.photoUrl!)
                }
            }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
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

//
//  HomeViewController.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 30.11.2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {
    @IBOutlet weak var usersTableView: UITableView!
    var list = [UserListItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadTable()
    }
    

    @IBAction func logout(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "signInViewController") as! SignInViewController
            self.present(vc, animated: true)
            
        } catch {
            print(error.localizedDescription)
        }
            
    }
    
    func loadTable() {
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        print(Auth.auth().currentUser?.uid )
        
        let databaseRef = Database.database().reference()
        databaseRef.child(Child.USERS).observe(.value) { shapshot in
            
            self.list.removeAll()
            print("Auth.auth().currentUser?.uid \(Auth.auth().currentUser?.uid)")
            for child in shapshot.children {
                if let childSnapshot = child as? DataSnapshot, let user = UserListItem(snapshot: childSnapshot) {
                    
                    print("user.uid \(user.uid)")
                    if user.uid != Auth.auth().currentUser?.uid {
                        self.list.append(user)
                    }
                    
                    DispatchQueue.main.async {
                        self.usersTableView.reloadData()
                    }
                } else {
                    print ("veri aliminda hata var")
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


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeIndetifier", for: indexPath) as! HomeTableViewCell
        cell.configure(userItem: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chatViewController") as! ChatViewController
        vc.recipientName = list[indexPath.row].name!
        vc.recipientUid = list[indexPath.row].uid!
        self.present(vc, animated: true)
        
    }
}

extension HomeViewController: UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "inboxViewController") as! InboxViewController
            self.present(vc, animated: true)
        } else { // 1
            let vc = storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
            self.present(vc, animated: true)
        }
    }
}

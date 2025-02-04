//
//  InboxViewController.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 30.11.2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class InboxViewController: UIViewController {
    
    
    @IBOutlet weak var userTableView: UITableView!
    var list = [UserListItem]()
    var databaseRef: DatabaseReference!
    var auth: Auth!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        databaseRef = Database.database().reference()
        auth = Auth.auth()
        loadTable()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func loadTable() {
        databaseRef.child(Child.CHAT_INBOX)
            .queryOrdered(byChild: "senderUid")
            .queryEqual(toValue: self.auth.currentUser!.uid).observe(.value) { dataSnapshat in
                self.list.removeAll()
                for child in dataSnapshat.children {
                    let snap = child as! DataSnapshot
                    let chatListItem = UserListItem(snapshot: snap) //isRead, recipientUid,rowKey
                    
                    self.databaseRef.child(Child.USERS)
                        .queryOrdered(byChild: "uid")
                        .queryEqual(toValue: chatListItem?.recipientUid)
                        .observeSingleEvent(of: .value) { dataSnapshot in
                            for child in dataSnapshot.children {
                                let snap = child as! DataSnapshot
                                let userListItem = UserListItem(snapshot: snap) //name, photoURL
                                
                                let chatInboxItem = UserListItem(name: userListItem?.name, photoUrl: userListItem?.photoUrl, rowKey: userListItem?.rowKey, isRead: userListItem?.isRead, recipientUid: userListItem?.recipientUid)
                                
                                self.list.append(chatInboxItem)
                                
                               
                            }
                            self.userTableView.reloadData()
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


extension InboxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        let item = list[indexPath.row]
        cell.configure(userItem: item)
        cell.userImage.layer.cornerRadius = cell.userImage.frame.size.width / 2
        cell.userImage.clipsToBounds = true
        cell.userImage.layer.borderWidth = 2
        
        if item.isRead == "1"{
            cell.userImage.layer.borderColor = UIColor.green.cgColor
        } else {
            cell.userImage.layer.borderColor = UIColor.white.cgColor
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

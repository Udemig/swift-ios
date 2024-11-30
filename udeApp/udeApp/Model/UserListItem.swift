//
//  UserListItem.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 30.11.2024.
//

import Foundation
import FirebaseDatabase

class UserListItem {
    var uid: String?
    var name: String?
    var photoUrl: String?
    
    init(uid: String, name: String, photoUrl: String) {
        self.uid = uid
        self.name = name
        self.photoUrl = photoUrl
    }
    
    init?(snapshot: DataSnapshot){
        guard let value = snapshot.value as? [String: Any] else {
            return nil
        }
        
        self.uid = snapshot.key
        self.name = value["name"] as? String ?? "bilinmiyor"
        self.photoUrl = value["photoURL"] as? String
    }
    
    
}

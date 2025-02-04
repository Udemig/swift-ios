//
//  UserInfo.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 14.12.2024.
//

import Foundation
import FirebaseDatabase

class UserInfo {
    var name: String?
    var photoUrl: String?
    
    init(snapshot: DataSnapshot) {
        print("UserInfo \(snapshot)")
        if let dict = snapshot.value as! NSDictionary? {
            print("dict \(snapshot)")
            name = dict["name"] as? String
            photoUrl = dict["photoURL"] as? String
        }
    }
}

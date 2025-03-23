//
//  Tweet.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import Foundation
import FirebaseCore


struct Tweet: Identifiable {
    
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let caption: String
    let likes: Int
    let uid: String
    let timestamp: Timestamp
    let replyingTo: String

    
    
    init(dictionary: [String: Any]) {
        
        self.id = dictionary["id"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.replyingTo = dictionary["replyingTo"] as? String ?? ""
        
    }
    
}


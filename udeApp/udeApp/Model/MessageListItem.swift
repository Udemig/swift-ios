//
//  MessageListItem.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 30.11.2024.
//

import Foundation

class MessageListItem {
    var senderUid: String?
    var message: String?
    
    init(senderUid: String, message: String) {
        self.senderUid = senderUid
        self.message = message
    }
}

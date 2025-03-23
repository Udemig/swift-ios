//
//  UploadTweetViewModel.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class UploadTweetViewModel: ObservableObject {
    
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullname,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "likes": 0,
                                   "id": docRef.documentID]
        
        docRef.setData(data) { _ in
            print("tweet basari ile gonderildi")
            self.isPresented = false
        }
    }
}

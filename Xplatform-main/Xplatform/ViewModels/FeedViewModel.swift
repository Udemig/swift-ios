//
//  FeedViewModel.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import Foundation
import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fecthTweets()
    }
    
    func fecthTweets() {
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.map({Tweet(dictionary: $0.data())})
            print("tweetler \(self.tweets)")
        }
    }
}

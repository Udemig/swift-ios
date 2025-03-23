//
//  Constants.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import Foundation
import FirebaseFirestore

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_TWEETS = Firestore.firestore().collection("tweets")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")


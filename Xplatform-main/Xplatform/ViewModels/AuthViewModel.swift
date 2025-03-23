//
//  AuthViewModel.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import Foundation
import FirebaseAuth
import UIKit
import FirebaseStorage
import FirebaseFirestore

class AuthViewModel: ObservableObject {

    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init(){
          userSession = Auth.auth().currentUser
            fecthUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Giris yaparken hata oldu: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fecthUser()
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("resim yuklenirken hata oldu \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteURL else { return }
                let profileImageUrlStr = profileImageUrl.absoluteString
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("kullanici olusturulurken hata oldu \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = [
                        "email": email,
                        "username": username,
                        "fullname": fullname,
                        "profileImageUrl": profileImageUrlStr,
                        "uid": user.uid] as [String: Any]
                    
                    Firestore.firestore().collection("users").document(user.uid)
                        .setData(data) { _ in
                            self.userSession = user
                            self.fecthUser()
                        }
                }
            }
            
        }
    }
    
    func fecthUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
        }
    }
    
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func tabTitle(forIndex index: Int) -> String {
        switch index{
        case 0:
            return "Anasayfa"
        case 1:
            return "Ara"
        case 2:
            return "Bildirimler"
        case 3:
            return "Mesajlar"
        default:
            return ""
        }
    }
    
}

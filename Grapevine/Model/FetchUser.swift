//
//  FetchUser.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI
import Firebase

// Global Refernce

let ref = Firestore.firestore()

func fetchUser(uid: String, completion: @escaping (UserModel) -> ()) { // Pulls user data from Firestore
    
    ref.collection("Users").document(uid).getDocument { (doc, err) in
        guard let user = doc else { return }
        
        let username = user.data()?["username"] as! String    // -\
        let pic = user.data()?["imageurl"] as! String         //   |
        let bio = user.data()?["bio"] as! String              //   |
        let facebook = user.data()?["facebook"] as! String?   //   |--- gets all data from firestore and saves
        let twitter = user.data()?["twitter"] as! String?     //   |
        let linkedin = user.data()?["linkedin"] as! String?   //   |
        let instagram = user.data()?["instagram"] as! String? // -/
        let uid = user.documentID
        
        DispatchQueue.main.async {
            completion(UserModel(username: username, pic: pic, bio: bio, uid: uid, facebook: facebook, twitter: twitter, linkedin: linkedin, instagram: instagram))  // UserModel is generated with all data
        }
    }
}

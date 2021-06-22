//
//  UserModel.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct UserModel { // Defines basic properties of a user
    var username : String
    var pic : String
    var bio: String
    var uid : String
    var facebook : String? = nil
    var twitter : String? = nil
    var linkedin : String? = nil
    var instagram : String? = nil
    
    func get(_ item: socials) -> String { // Returns social media data of the user based on an input member of the `socials` enum
        switch item {
        case .facebook:
            return self.facebook != nil ? self.facebook! : "None"
        case .instagram:
            return self.instagram != nil ? self.instagram! : "None"
        case .linkedin:
            return self.linkedin != nil ? self.linkedin! : "None"
        case .twitter:
            return self.twitter != nil ? self.twitter! : "None"
        }
    }
}

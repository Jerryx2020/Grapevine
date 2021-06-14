//
//  UserModel.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct UserModel {
    var username : String
    var pic : String
    var bio: String
    var uid : String
    var facebook : String?
    var twitter : String?
    var linkedin : String?
    var instagram : String?
    
    func get(_ item: socials) -> String? {
        switch item {
        case .facebook:
            return self.facebook
        case .instagram:
            return self.instagram
        case .linkedin:
            return self.linkedin
        case .twitter:
            return self.twitter
        default:
            return nil
        }
    }
}

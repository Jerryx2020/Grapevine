//
//  PostModel.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct PostModel : Identifiable {
    
    var id: String
    var title : String
    var pic: String
    var time : Date
    var user: UserModel
}

//
//  Logo.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/16/21.
//

import SwiftUI

struct Logo: View { // Defines a view that shows a picture
    @Binding var selectedTab : String
    var body: some View {
        
        HStack {
            VStack {
                Image(systemName: "square.and.pencil")
                Spacer()
            }
            .padding()
        }
          
    }
}

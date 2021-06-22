//
//  CustomTabbar.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct CustomTabbar: View { // Defines tab bar used at the bottom of the main screen to switch from feed to settings
    @Binding var selectedTab : String // Allows bar to control view
    var body: some View {
        
        HStack(spacing: 65) {
            
            TabButton(title: "Posts", selectedTab: $selectedTab)
            
            TabButton(title: "Settings", selectedTab: $selectedTab)
        }
        .padding(.horizontal)
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct TabButton : View { // Defines tab button for reuse in the tab bar
    
    var title : String
    @Binding var selectedTab : String // Allows button to control bar
    
    var body: some View{
        
        Button(action: {selectedTab = title}) {
            
            VStack(spacing: 5){
                
                Image(title)
                    .renderingMode(.template)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .foregroundColor(selectedTab == title ? Color("blue") : .gray) // Changes color to indicate selection
            .padding(.horizontal)
            .padding(.vertical,10)
        }
    }
}


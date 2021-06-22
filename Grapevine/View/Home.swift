//
//  Home.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct Home: View { // Integrates feed and settings views
    
    @State var selectedTab = "Posts" // Updates view based on tab selection
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            // Custom Tab Bar....
            
            ZStack{
                
                PostView()
                    .opacity(selectedTab == "Posts" ? 1 : 0) // Shows `PostView` if its tab is selected
                
                SettingsView()
                    .opacity(selectedTab == "Settings" ? 1 : 0) // Shows `SettingsView` if its tab is selected
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabbar(selectedTab: $selectedTab) // Adds tab bar to control view
                .padding(.bottom,edges!.bottom == 0 ? 15 : 0)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}


//
//  UserView.swift
//  Grapevine
//
//  Created by Nathan Bronson on 6/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserView: View { // Creates visual representation of another user's bio
    @Binding var selectedUser: UserModel? // Allows this view to return to main feed view
    
    @StateObject var postData = PostViewModel()
    
    let User: UserModel
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    init(_ user: UserModel, _ sel: Binding<UserModel?>) {
        self.User = user
        self._selectedUser = sel
    }
    var body: some View {
        
        VStack {
            HStack {
                
                Text("User")
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                Button(action: { self.selectedUser = nil }, label: {
                    Text("Back")
                        .font(Font.custom("ITC Avant Garde Gothic Bold", size: 12))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(15)
                })
                .padding()
                
            }
            .padding()
            .padding(.top, edges!.top)

            // Top Shadow Effect...
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if self.User.pic != "" {
                
                ZStack {
                    
                    WebImage(url: URL(string: self.User.pic)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                }
                .padding(.top,25)
            }
            
            HStack(spacing: 15) {
                
                Text(self.User.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            
            HStack(spacing: 15) {
                
                Text(self.User.bio)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            .padding()
            
            ForEach(socials.allCases, id: \.id) { value in // Shows each social media credential
                let r: String = self.User.get(value)
                if r != "None" {
                    Text(value.id.capitalized + ": " + r)
                        .foregroundColor(.white)
                        .onTapGesture {
                            if let link = URL(string: value.link + r) {
                                UIApplication.shared.open(link)
                            } // Allows a tap on the credential to open the users' profile in the browser
                        }
                }
            }
            
            Text("_______________________________________")
                .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                .foregroundColor(.white)
                .padding()
                .padding(.top)
                .padding(.top)
            
            ScrollView {
                
                VStack(spacing: 15) {
                    
                    ForEach(self.postData.posts.filter({ $0.user.username == self.User.username })) { post in // Shows all of user's posts
                        
                        PostRow(selectedUser: self.$selectedUser, post: post, postData: postData)
                    }
                }
                .padding()
                .padding(.bottom, 55)
            }
            Spacer(minLength: 0)
        }
        .background(Color("bg"))
        .cornerRadius(15)
    }
}

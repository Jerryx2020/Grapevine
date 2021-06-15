//
//  PostRow.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct PostRow: View {
    @Binding var selectedUser: UserModel?
    
    @State var isLiked: Bool = false
    @State var isSharing: Bool = false
    
    var post : PostModel
    @ObservedObject var postData : PostViewModel
    let uid = Auth.auth().currentUser!.uid
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack(spacing: 10){
                
                WebImage(url: URL(string: post.user.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        self.selectedUser = self.post.user
                    }
                
                Text(post.user.username)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .onTapGesture {
                        self.selectedUser = self.post.user
                    }
                
                Spacer(minLength: 0)
                
                // displaying only posted user...
                
                    
                    Menu(content: {
                        if post.user.uid == uid{
                            Button(action: {postData.editPost(id: post.id)}) {
                                
                                Text("Edit")
                            }
                            
                            Button(action: {postData.deletePost(id: post.id)}) {
                                
                                Text("Delete")
                            }
                        }
                        Button(action: {self.isSharing = true}) {
                            Text("Share")
                        }
                        
                    }, label: {
                        
                        Image("menu")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                    })
            }
            
            if post.pic != ""{
                
                WebImage(url: URL(string: post.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 60, height: 250)
                    .cornerRadius(15)
            }
            
            HStack{
                
                Text(post.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            .padding(.top,5)
            
            HStack{
                
                Spacer(minLength: 0)
                
                Text(post.time, style: .date)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(post.time, style: .time)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }

        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(15)
        .sheet(isPresented: self.$isSharing, content: {
            ShareSheet(sharing: [self.share()])
        })
    }
    
    func share() -> String {
        return self.post.user.username + " said: " + self.post.title
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController

    var sharing: [Any]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        UIActivityViewController(activityItems: sharing, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {

    }
}

//
//  PostView.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct PostView: View {
    @State var showsSearch: Bool = false
    @State var search: String = ""
    @State var answer: String = ""
    @State var searchLoop: DispatchWorkItem? = nil
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    
    let QA: QAHandler
    
    init() {
        self.QA = QAHandler()
    }
    
    var body: some View {
       
        VStack{
            
            HStack {
                
                Text("Feed")
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
                Image("Logo")
                Spacer()
                
                Button(action: {postData.newPost.toggle()}) {
                    
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(Color("blue"))
                }
            }
            .padding()
            .padding(.top,edges!.top)
            // Top Shadow Effect...
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            HStack {
                TextField("Search", text: self.$search)
                    .padding()
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 16))
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
            }
            .padding()
            
            if !search.isEmpty && search.range(of: "?") != nil {
                Text(self.answer)
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                    .foregroundColor(.white)
                    .onChange(of: self.search, perform: { value in
                        if self.searchLoop != nil {
                            self.searchLoop!.cancel()
                            self.searchLoop = nil
                        }
                        self.searchLoop = DispatchWorkItem {
                            let l: String = self.QA.find(value, self.postData.posts.map({ $0.id }))
                            DispatchQueue.main.sync {
                                self.answer = l
                            }
                        }
                        DispatchQueue.global().async(execute: self.searchLoop!)
                    })
            }
            if postData.posts.isEmpty{
                
                Spacer(minLength: 0)
                
                if postData.noPosts{
                    
                    Text("No Posts !!!")
                }
                else{
                    
                    ProgressView()
                }
                
                Spacer(minLength: 0)
            }
            else {
                
                ScrollView{
                    
                    VStack(spacing: 15){
                        
                        ForEach(self.search.isEmpty ? postData.posts : searchFunc(self.search)) {post in
                            
                            PostRow(post: post,postData: postData)
                        }
                    }
                    .padding()
                    .padding(.bottom,55)
                }
            }
        }
        .fullScreenCover(isPresented: $postData.newPost) {
            
            NewPost(updateId : $postData.updateId)
        }
    }
    
    func searchFunc(_ query: String) -> [PostModel] {
        var l: [PostModel] = self.postData.posts.filter({ $0.title.range(of: query) != nil || $0.id.range(of: query) != nil || $0.time.description.range(of: query) != nil || $0.user.username.range(of: query) != nil })
        return l
    }
}

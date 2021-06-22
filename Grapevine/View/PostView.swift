//
//  PostView.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct PostView: View { // Defines visual representation of the feed
    @State var showsSearch: Bool = false // Controls whether search results are shown
    @State var search: String = "" // Contains search query
    @State var answer: String = "" // Contains answer from QAHandler
    @State var searchLoop: DispatchWorkItem? = nil // Stores the process under which the QAHandler is running so a query doesn't interfere with app responsiveness
    @State var isSearching: Bool = false // Holds whether the user is searching
    @State var selectedUser: UserModel? = nil // Contains `UserModel` to be displayed
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel() // Contains underlying functionality of `PostView`
    
    let QA: QAHandler
    
    init() {
        self.QA = QAHandler() // Defines QAHandler
    }
    
    var body: some View {
       
        ZStack(alignment: .center) {
            if self.selectedUser != nil { // Shows user details if a user is selected
                UserView(self.selectedUser!, self.$selectedUser)
                    .zIndex(0)
            } else {
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
                            .onChange(of: self.search, perform: { value in // Controls QAHandler in a background process
                                self.answer = "Searching..."
                                if self.search.range(of: "?") != nil {
                                    DispatchQueue.global().async {
                                        let l: String = self.QA.find(self.search, self.postData.posts.map({ $0.title }))
                                        DispatchQueue.main.sync {
                                            self.answer = l
                                        }
                                    }
                                }
                            })
                    }
                    .padding()
                    if postData.posts.isEmpty {
                        
                        Spacer(minLength: 0)
                        
                        if postData.noPosts {
                            
                            Text("No Posts !!!")
                        }
                        else{
                            
                            ProgressView()
                        }
                        
                        Spacer(minLength: 0)
                    }
                    else {
                        
                        ScrollView {
                            
                            VStack(spacing: 15) {
                                if !search.isEmpty && search.range(of: "?") != nil { // Shows intelligent QA answer if the question mark signal is used
                                    Text(self.answer)
                                        .lineLimit(nil)
                                        .font(Font.custom("ITC Avant Garde Gothic Bold", size: 12))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.white.opacity(0.06))
                                        .cornerRadius(15)
                                }
                                
                                ForEach(self.search.isEmpty ? postData.posts : searchFunc(self.search)) {post in // Shows relevant posts as defined by `searchFunc`
                                    
                                    PostRow(selectedUser: self.$selectedUser, post: post, postData: postData)
                                }
                            }
                            .padding()
                            .padding(.bottom, 55)
                        }
                    }
                }
                .fullScreenCover(isPresented: $postData.newPost) {
                    
                    NewPost(updateId : $postData.updateId)
                }
            }
        }
    }

    func relevance(_ terms: [String], _ content: PostModel) -> Bool {
        var conditions: [Bool] = terms.map({ content.title.lowercased().range(of: $0) != nil || content.id.lowercased().range(of: $0) != nil || content.time.description.lowercased().range(of: $0) != nil || content.user.username.lowercased().range(of: $0) != nil })
        return conditions.contains(true)
    }
    
    func searchFunc(_ query: String) -> [PostModel] { // Implements criteria for relevance when searching
        let _query: String = query.lowercased()
        let _terms: [String] = _query.components(separatedBy: " ")
        return self.postData.posts.filter({ relevance(_terms, $0) })
    }
}

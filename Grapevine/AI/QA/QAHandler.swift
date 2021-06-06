//
//  QAHandler.swift
//  Grapevine
//
//  Created by Nathan Bronson on 5/31/21.
//

import Foundation

struct QAHandler {
    @StateObject var postData: PostViewModel?
    
    let BertInterface: BertQAHandler = BertQAHandler()
    let posts: [PostModel]
    
    init(posts: [String] = []) {
        if posts.isEmpty{
            self.postData = PostViewModel()
            self.posts = self.postData!.posts.map({ $0.title })
        } else {
            self.postData = nil
            self.posts = posts
        }
    }
    
    func ask(_ query: String, _ content: String) -> String { //query is question content is source
        return self.BertInterface.run(query: query, content: content)?.answer.text.value ?? ""
    }
    
    func find(_ query: String, _ sources: [String] = self.posts) -> String {
        var answers: [String] = []
        for i in sources {
            let n: String = ask(query, i)
            if !n.isEmpty {
                answers.append(n)
            }
        }
        if answers.count == 0 {
            return "Sorry, we couldn't find anything."
        } else if answers.count == 1 {
            return answers[0]
        } else {
            var out: String = ""
            out += answers[0]
            answers.remove(at: 0)
            for i in answers {
                out += "\n"
            }
            return out
        }
    }
}

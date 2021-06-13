//
//  QAHandler.swift
//  Grapevine
//
//  Created by Nathan Bronson on 5/31/21.
//

import Foundation
import SwiftUI

extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = startIndex.advancedBy(r.endIndex - r.startIndex)

            return self[Range(start: startIndex, end: endIndex)]
        }
    }
}

struct QAHandler {
    
    let BertInterface: BertQAHandler = try! BertQAHandler()
    let posts: [String]
    
    init(posts: [String] = []) {
        if posts.isEmpty {
            //self.postData = PostViewModel()
            let postD: PostViewModel = PostViewModel()
            self.posts = postD.posts.map({ $0.id })
        } else {
            //self.postData = nil
            self.posts = posts
        }
    }
    
    func ask(_ query: String, _ content: String) -> String { //query is question content is source
        let l: Int = self.BertInterface.run(query: query, content: content)?.answer.text.range.lowerBound.hashValue ?? 0
        let u: Int = self.BertInterface.run(query: query, content: content)?.answer.text.range.upperBound.hashValue ?? 0
        return content[u...l]
    }
    
    func find(_ query: String, _ sources: [String]) -> String {
        var answers: [String] = []
        var out: String = ""
        var den: Int = sources.count
        var num: Int = 0
        print("\(num)/\(den)")
        print(answers)
        for i in sources {
            print(num/den, "\(num)/\(den)", i)
            let n: String = self.ask(query, i)
            if !n.isEmpty {
                answers.append(n)
            }
        }
        if answers.count == 0 {
            out = "Sorry, we couldn't find anything."
        } else if answers.count == 1 {
            out = answers[0]
        } else {
            out = ""
            out += answers[0]
            answers.remove(at: 0)
            for i in answers {
                out += i + "\n"
            }
        }
        return out
    }
}

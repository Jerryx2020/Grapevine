//
//  QAHandler.swift
//  Grapevine
//
//  Created by Nathan Bronson on 5/31/21.
//

import Foundation
import SwiftUI


struct QAHandler {
    
    let BertInterface: BertQAHandler = try! BertQAHandler()
    let posts: [String]
    
    init(posts: [String] = []) {
        if posts.isEmpty {
            //self.postData = PostViewModel()
            let postD: PostViewModel = PostViewModel()
            self.posts = postD.posts.map({ $0.title })
        } else {
            //self.postData = nil
            self.posts = posts
        }
    }
    
    func getNouns(_ text: String) -> [String] {
        var nouns: [String] = []
        let tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
        tagger.string = text
        let range = NSRange(location: 0, length: text.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.enumerateTags(in: range, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange, _ in
            if let tag = tag {
                let word = (text as NSString).substring(with: tokenRange)
                if tag == NSLinguisticTag.noun {
                    nouns.append(word)
                    print(word)
                }
            }
        }
        return nouns
    }
    
    func oneIsIn(_ li: [String], _ full: String) -> Bool {
        for i in li {
            if full.lowercased().range(of: i.lowercased() + " ") != nil {
                return true
            }
        }
        return false
    }
    
    func ask(_ query: String, _ content: String) -> String { //query is question content is source
        let q = self.BertInterface.run(query: query, content: content)?.answer.text.value ?? ""
        return q
    }
    
    func find(_ query: String, _ sources: [String]) -> String {
        var answers: [String] = []
        var out: String = ""
        let nouns: [String] = self.getNouns(query).map({ String($0) })
        let den: Int = sources.count
        var num: Int = 0
        print("\(num)/\(den)")
        print(answers)
        for i in sources.filter({ self.oneIsIn(nouns, $0) }) {
            print(num/den, "\(num)/\(den)", i)
            let n: String = self.ask(query, i)
            if !n.isEmpty {
                answers.append(n)
            }
            num += 1
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
                out += i
                if out.last! != "." {
                    out += "."
                }
                if out.last! != " " {
                    out += " "
                }
            }
        }
        return out
    }
}

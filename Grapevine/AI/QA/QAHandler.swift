//
//  QAHandler.swift
//  Grapevine
//
//  Created by Nathan Bronson on 5/31/21.
//

import Foundation
import SwiftUI


struct QAHandler {
    
    let BertInterface: BertQAHandler = try! BertQAHandler() // Defines the BertQAHandler that will be further abstracted
    let posts: [String] // Defines container for default posts
    
    init(posts: [String] = []) { // Initializes the QAHandler
        if posts.isEmpty {
            let postD: PostViewModel = PostViewModel()
            self.posts = postD.posts.map({ $0.title })
        } else {
            self.posts = posts
        } // Initializes posts conditionally
    }
    
    func getNouns(_ text: String) -> [String] { // Utility for finding all nouns in a string; used to find keywords in query and content to prune the search space
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
                }
            }
        }
        return nouns
    }
    
    func oneIsIn(_ li: [String], _ full: String) -> Bool { // Utility for finding whether one if a list (li) of strings are in a passage (full)
        for i in li {
            if full.lowercased().range(of: i.lowercased() + " ") != nil {
                return true
            }
        }
        return false
    }
    
    func ask(_ query: String, _ content: String) -> String { // Abstracts the BertQAHandler run function; query is question content is source
        let q = self.BertInterface.run(query: query, content: content)?.answer.text.value ?? ""
        return q
    }
    
    func find(_ query: String, _ sources: [String]) -> String { // Wraps the ask function into a top level API that searches several sources for an answer after filtering by whether they share nouns; all prints are used as logging when debugging
            var answers: [String] = []
            var out: String = ""
            let nouns: [String] = self.getNouns(query).map({ String($0) }) // Analyzes question
            let den: Int = sources.count
            var num: Int = 0
            print("\(num)/\(den)")
            print(answers)
            for i in sources.filter({ self.oneIsIn(nouns, $0) }) { // Finds relevant sources
                print(num/den, "\(num)/\(den)", i)
                let n: String = self.ask(query, i) // Runs inference on relevant sources
                if !n.isEmpty {
                    answers.append(n) // Stores answer
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
            } // Creates human readable answer
            return out
    }
}

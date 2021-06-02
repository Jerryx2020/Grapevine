//
//  IntentHandler.swift
//  AskIntent
//
//  Created by Nathan Bronson on 6/2/21.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        guard intent is AskIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }
        return SearchingIntentHandler()
    }
    
}

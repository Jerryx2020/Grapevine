//
//  AlertView.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/16/21.
//

import SwiftUI

func alertView(msg: String, completion: @escaping (String) -> ()) { // Wraps an alert function to be showed with a simple call
    
    let alert = UIAlertController(title: "Message", message: msg, preferredStyle: .alert)
    
    alert.addTextField { (txt) in
        txt.placeholder = msg.contains("Verification") ? "123456" : "" // Checks whether alert is being used for dummy verification
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
    
    alert.addAction(UIAlertAction(title: msg.contains("Verification") ? "Verify" : "Update", style: .default, handler: { (_) in // Checks wheter alert is being used for dummy verification or user data updating
        
        let code = alert.textFields![0].text ?? ""
        
        if code == "" {
            // Repromoting..
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
            return
        }
        completion(code)
    }))
    
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
}

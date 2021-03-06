//
//  LoginViewModel.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI
import Firebase

class LoginViewModel : ObservableObject { // Defines underlying functionality of login page
    
    @Published var code = ""
    @Published var number = ""
    
    // For Any Errors..
    @Published var errorMsg = ""
    @Published var error = false
    
    @Published var registerUser = false
    @AppStorage("current_status") var status = false
    
    // Loading when Searches for user...
    @Published var isLoading = false
    
    func verifyUser() {
        
        isLoading = true
        
        // Remove When Testing In Live
        //Auth.auth().settings?.isAppVerificationDisabledForTesting = true // Makes authentication a placeholder
        
        let phoneNumber = "+" + code + number
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (ID, err) in // Verifies phone number
            
            if err != nil {
                self.errorMsg = err!.localizedDescription
                self.error.toggle()
                self.isLoading = false
                return
            }
            
            // Code Sent Successfully...
            
            alertView(msg: "Enter Verification Code") { (Code) in // Prompts user for verification code
                
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: ID!, verificationCode: Code)
                
                Auth.auth().signIn(with: credential) { (res, err) in
                    
                    if err != nil {
                        self.errorMsg = err!.localizedDescription
                        self.error.toggle()
                        self.isLoading = false
                        return
                    }
                    
                    self.checkUser()
                }
            }
        }
    }
    
    func checkUser() {
        
        let ref = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid
        
        ref.collection("Users").whereField("uid", isEqualTo: uid).getDocuments { (snap, err) in
            
            if err != nil {
                // No Documents..
                // No User Found...
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            
            if snap!.documents.isEmpty {
                
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            self.status = true
        }
    }
}

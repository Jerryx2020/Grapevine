//
//  Login.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct Login: View { // Defines view shown when loggin in
    
    @StateObject var loginData = LoginViewModel() // Defines object that controls the underlying login functions
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Login")
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 15) {
                
                TextField("1", text: $loginData.code)
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(width: 45)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
                
                TextField("Enter phone number", text: $loginData.number)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top,10)
            
            if loginData.isLoading{
                ProgressView()
                    .padding()
            }
            else{
                Button(action: loginData.verifyUser, label: {
                    Text("Verify")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("blue"))
                        .clipShape(Capsule())
                })
                .disabled(loginData.code == "" || loginData.number == "" ? true : false) // Ensures that phone number and country code fields contain data
                .opacity(loginData.code == "" || loginData.number == "" ? 0.5 : 1) // Creates visual effect that echoes the above sentiment
            }
            
            Spacer(minLength: 0)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        
        // Displaying Alert...
        .alert(isPresented: $loginData.error, content: {
            
            Alert(title: Text("Uh Oh!"), message: Text(loginData.errorMsg), dismissButton: .destructive(Text("Ok")))
        })
        .fullScreenCover(isPresented: $loginData.registerUser, content: {
            
            Register()
        })
    }
}


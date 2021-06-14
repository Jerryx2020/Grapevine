//
//  SettingsView.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SettingsView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    var body: some View {
        ScrollView {
            VStack{
                
                HStack{
                    
                    Text("Settings")
                        .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                }
                .padding()
                .padding(.top,edges!.top)
                // Top Shadow Effect...
                .background(Color("bg"))
                .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
                
                if settingsData.userInfo.pic != ""{
                    
                    ZStack{
                        
                        WebImage(url: URL(string: settingsData.userInfo.pic)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                        
                        if settingsData.isLoading{
                            
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color("blue")))
                        }
                    }
                    .padding(.top,25)
                    .onTapGesture {
                        settingsData.picker.toggle()
                    }
                }
                
                HStack(spacing: 15){
                    
                    Text(settingsData.userInfo.username)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    // Edit Button...
                    
                    Button(action: {settingsData.updateDetails(field: "Name")}) {
                        
                        Image(systemName: "pencil.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                HStack(spacing: 15){
                    
                    Text(settingsData.userInfo.bio)
                        .foregroundColor(.white)
                    
                    // Edit Button...
                    
                    Button(action: {settingsData.updateDetails(field: "Bio")}) {
                        
                        Image(systemName: "pencil.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                
                ForEach(socials) { i in
                    HStack(spacing: 15){
                        
                        Text(i.rawValue + ": " + self.settingsData.userInfo.get(i)? ?? "None")
                            .foregroundColor(.white)
                        
                        // Edit Button...
                        
                        Button(action: {settingsData.updateDetails(field: i.rawValue)}) {
                            
                            Image(systemName: "pencil.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }

                // LogOut Button...
                
                Button(action: settingsData.logOut, label: {
                    Text("Logout")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("blue"))
                        .clipShape(Capsule())
                })
                .padding()
                .padding(.top,10)
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $settingsData.picker) {
             
                ImagePicker(picker: $settingsData.picker, img_Data: $settingsData.img_data)
            }
            .onChange(of: settingsData.img_data) { (newData) in
                // whenever image is selected update image in Firebase...
                settingsData.updateImage()
            }
        }
    }
}

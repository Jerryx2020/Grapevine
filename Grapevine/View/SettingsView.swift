//
//  SettingsView.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI
import SDWebImageSwiftUI
import MessageUI

struct SettingsView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    @State var bug: Bool = false
    @State var alert: Bool = false
    let canSent: Bool = MFMailComposeViewController.canSendMail()
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
                        .fontWeight(.heavy)
                    
                    // Edit Button...
                    
                    Button(action: {settingsData.updateDetails(field: "Bio")}) {
                        
                        Image(systemName: "pencil.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(socials.allCases, id: \.id) { value in
                        HStack(spacing: 15){
                            
                            Text(value.id.capitalized + ": " + self.settingsData.userInfo.get(value))
                                .foregroundColor(.white)
                            
                            // Edit Button...
                            
                            Button(action: {
                                alertView(msg: "Update \(value.id.capitalized)") { (txt) in
                                    settingsData.updateBio(id: value.id, value: txt)
                                }
                            }) {
                                
                                Image(value.id)
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25, alignment: .center)
                            }
                        }
                    }
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
                Button(action: {
                    if self.canSent {
                        self.bug = true
                    } else {
                        self.alert = true
                    }
                }, label: {
                    Text("Report a Bug")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 225)
                        .background(Color("blue"))
                        .clipShape(Capsule())
                })
                
                Spacer(minLength: 300)
            }
            .sheet(isPresented: $settingsData.picker) {
             
                ImagePicker(picker: $settingsData.picker, img_Data: $settingsData.img_data)
            }
            .sheet(isPresented: self.$bug) {
                Email()
            }
            .onChange(of: settingsData.img_data) { (newData) in
                // whenever image is selected update image in Firebase...
                settingsData.updateImage()
            }
            .alert(isPresented: self.$alert, content: {
                
                Alert(title: Text("Uh Oh!"), message: Text("This device cannot send mail! To report a bug, use a device that has email capabilities. You can, however, use Gmail through the web. Address your email to grapevinefbla@gmail.com."), primaryButton: .destructive(Text("Ok")), secondaryButton: .default(Text("Go To Gmail"), action: {
                    UIApplication.shared.open(URL(string: "https://www.gmail.com/")!)
                }))
            })
        }
    }
}

struct Email: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = MFMailComposeViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<Email>) -> MFMailComposeViewController {
        let compose: MFMailComposeViewController = MFMailComposeViewController()
        compose.setToRecipients(["grapevinefbla@gmail.com"])
        compose.setSubject("Bug Report")
        compose.setMessageBody("Dear Grapevine Bug Team,", isHTML: false)
        return compose
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<Email>) {

    }
}

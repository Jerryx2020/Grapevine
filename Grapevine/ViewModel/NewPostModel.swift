//
//  NewPostModel.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI
import Firebase

class NewPostModel : ObservableObject { // Defines functionality needed to make a new post
    
    @Published var postTxt = ""
    // Image Picker...
    @Published var picker = false
    @Published var img_Data = Data(count: 0)
    
    // disabling all controls while posting...
    @Published var isPosting = false
    
    let uid = Auth.auth().currentUser!.uid
    
    func post(updateId: String, present: Binding<PresentationMode>) {
        
        // posting Data...
        
        isPosting = true
        
        if updateId != "" {
            
            // Updating Data...
            
            ref.collection("Posts").document(updateId).updateData([
            
                "title": postTxt // Updates text
            ]) { (err) in
                
                self.isPosting = false
                if err != nil { return }
                
                present.wrappedValue.dismiss()
            }
            
            return
        }
        
        if img_Data.count == 0 {
            
            ref.collection("Posts").document().setData([
            
                "title": self.postTxt,
                "url": "",
                "ref": ref.collection("Users").document(self.uid),
                "time": Date()
                
            ]) { (err) in
                
                if err != nil {
                    self.isPosting = false
                    return
                }
                
                self.isPosting = false
                // Closing View When Successfuly Posted...
                present.wrappedValue.dismiss()
            }
        } else {
            
            UploadImage(imageData: img_Data, path: "post_Pics") { (url) in
                
                ref.collection("Posts").document().setData([
                
                    "title": self.postTxt,
                    "url": url,
                    "ref": ref.collection("Users").document(self.uid),
                    "time": Date()
                    
                ]) { (err) in
                    
                    if err != nil{
                        self.isPosting = false
                        return
                    }
                    
                    self.isPosting = false
                    // closing View When Successfuly Posted...
                    present.wrappedValue.dismiss()
                }
            }
        }
    }
}

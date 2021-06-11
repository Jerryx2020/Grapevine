//
//  ContentView.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("current_status") var status = false
    //@State var notFirst: Bool = UserDefaults.standard.bool(forKey: "notfirst") //this makes it only show up on first run
    @State var notFirst: Bool = false //comment this if the above line is uncommented
    var body: some View {

        NavigationView{
            
            VStack{
                if !self.notFirst {
                    IntroductionView(notFirst: self.$notFirst)
                } else {
                    if status{Home()}
                    else{Login()}
                }
            }
            .preferredColorScheme(.dark)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

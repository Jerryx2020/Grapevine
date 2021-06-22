//
//  ContentView.swift
//  Grapevine
//
//  Created by Jerry Xia on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("current_status") var status = false
    //@State var notFirst: Bool = UserDefaults.standard.bool(forKey: "notfirst") // This makes the `IntroductionView` appear only on first run; remove first set of comment marks and comment next line to enable this functionality
    @State var notFirst: Bool = false // Comment this if the above line is uncommented
    var body: some View {

        NavigationView {
            
            VStack {
                if !self.notFirst {
                    IntroductionView(notFirst: self.$notFirst)
                } else {
                    if status {Home()} else {Login()}
                } // Shows `IntroductionView` if first login and, if not, `Home` if logged in, else `Login`
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

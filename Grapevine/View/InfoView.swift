//
//  InfoView.swift
//  Grapevine
//
//  Created by Nathan Bronson on 6/8/21.
//

import SwiftUI

struct InformationDetailView: View { // Defines component of opening view that gives description of the app
    var title: String = "title"        // -\
    var subTitle: String = "subTitle"  //   |--- defines default values for each property
    var imageName: String = "car"      // -/

    var body: some View {
        HStack(alignment: .center) {
            if imageName != "Posts" {
                Image(systemName: imageName)
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 20))
                    .foregroundColor(.mainColor)
                    .padding()
                    .accessibility(hidden: true)
            } else {
                Image(imageName)
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 20))
                    .foregroundColor(.mainColor)
                    .padding()
                    .accessibility(hidden: true)
            } // Controls from what collection the image is selected

            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)

                Text(subTitle)
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 16))
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            } // Shows description
        }
        .padding(.top)
    }
}

struct InformationContainerView: View { // Wraps up all details of information view
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Post", subTitle: "Share experiences from working with your employer.", imageName: "square.and.pencil")

            InformationDetailView(title: "Feed", subTitle: "See posts from others to learn about potential employers.", imageName: "bubble.left.and.bubble.right")

            InformationDetailView(title: "Search", subTitle: "Search through all posts with keywords or use intelligent quesiton answering.", imageName: "magnifyingglass")
        }
        .padding(.horizontal)
        .background(Color("bg"))
    }
}

struct TitleView: View { // Creates title portion of introduction screen
    var body: some View {
        VStack {
            Image("Grad")// this doesn't exist, it just acts as a place holder
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .accessibility(hidden: true)

            Text("Welcome to")
                .customTitleText()

            Text("Grapevine")
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}

struct IntroductionView: View { // Implements all above structures into a single opening view
    @Binding var notFirst: Bool // Controls whether to show the view; this function is disabled so that the intro view shows every time the app is opened for demonstration purposes, all code for functioning is present, a line in the main view manager must be uncommented (this will be discussed in that file)
    
    var body: some View {
        HStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .center) {

                    Spacer()

                    TitleView()

                    InformationContainerView()

                    Spacer(minLength: 30)

                    Button(action: { // Continues to main portion of the app and ensures that the intro view will not be shown after the first launch
                        let generator = UINotificationFeedbackGenerator() // Makes the phone vibrate because haptics are fun
                        generator.notificationOccurred(.success)
                        UserDefaults.standard.set(true, forKey: "notfirst") // Sets a user default to specify that subsequent runs are not the first
                        self.notFirst = true
                    }) {
                        Text("Continue")
                            .customButton()
                    }
                    .padding(.horizontal)
                }
                .ignoresSafeArea(edges: .all)
                .background(Color("bg"))
            }
            .ignoresSafeArea(edges: .all)
            .background(Color("bg"))
        }
        .ignoresSafeArea(edges: .all)
        .background(Color("bg"))
    }
}

struct ButtonModifier: ViewModifier { // Wraps button modifiers for simplicity
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
    }
}

extension View { // Implements `ButtonModifier` with a call of `.customButton()`
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text { // Arranges modifiers that set text to title
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(Font.custom("ITC Avant Garde Gothic Bold", size: 36))
    }
}

extension Color { // Ads another way to refer to the "blue" color
    static var mainColor = Color("blue")
}

//
//  InfoView.swift
//  Grapevine
//
//  Created by Nathan Bronson on 6/8/21.
//  Derived from https://betterprogramming.pub/creating-an-apple-like-splash-screen-in-swiftui-fdeb36b47e81

import SwiftUI

struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

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
            }

            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 18))
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)

                Text(subTitle)
                    .font(Font.custom("ITC Avant Garde Gothic Bold", size: 16))
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct InformationContainerView: View {
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

struct TitleView: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100, width: 100, alignment: .center)
                .accessibility(hidden: true)

            Text("Welcome to")
                .customTitleText()

            Text("Grapevine")
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}

struct IntroductionView: View {
    @Binding var notFirst: Bool
    
    var body: some View {
        HStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .center) {

                    Spacer()

                    TitleView()

                    InformationContainerView()

                    Spacer(minLength: 30)

                    Button(action: {
                        let generator = UINotificationFeedbackGenerator()
                        generator.notificationOccurred(.success)
                        UserDefaults.standard.set(true, forKey: "notfirst")
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

struct ButtonModifier: ViewModifier {
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

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(Font.custom("ITC Avant Garde Gothic Bold", size: 36))
    }
}

extension Color {
    static var mainColor = Color("blue")
}

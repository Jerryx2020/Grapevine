# Grapevine
an app for sharing workplace experiences

## Usage
After loading the app for the first time you have two routes: you can either use an existing profile associated with a phone number, or you can use a new phone number in the database. Type into the "1" with the number 1 to signify the United States cell, next enter in your phone number from the database. Pressing verify will lead you to the next scene. The 2nd option would be the enter a phone number that is not associated with a profile. Follow the same steps as the 1st option but enter in the new phone number. This will prompt you to a new scene that says Register, enter in the information text that includes your name, bio and click on the circle with the image to view available profile pictures, click on the profile picture you want to choose it. After choosing you can click Register. The next scene will be identical for both options. (FEED PANEL) Scrolling will allow you to view existing posts in the database. Clicking the button at the top right will allow you to make a post. You can enter text in the empty white box, or select the image button to choose and image. You can do both at the same time. Pressing post will post the image. The three vertical circles will allow you to either edit or delete. Editing is the same process as posting a new text. The setting panel(Settings panel) will allow you to update an image as a profile, update your name, update your bio and logout. The process is the same as before.

## Purpose
Expanding the range of sharing job experience is our purpose for this app. When people are coming into jobs, they aren’t able to gain any first-hand physical experience through shadowing or other types of interning in person. When a person wants to get a job, due to the extremely high unemployment rate and demand for them, they need to be extremely knowledgeable about that job and what it holds for them, as there isn’t much job-to-job mobility at all. Choosing a job without any experience can be very dangerous, and could put people in worse situations. They need to have a general sense of what they can expect, as oftentimes, people have trouble admitting that there is a problem with something that they have. High schoolers would be very benefitting from the college campus and class experience. There are no detailed tours and guidance is very limited. We need an app that allows information to be shared. We need to make sure that people give real and honest reviews, so people aren’t misled, and they get the experience that they need.

## Project Structure
The structure of our Grapevine application in xCode was the following. We created sub-folders for every aspect of code to stay organized. Folders for data retrieval, methods and rules in the form of for example if statements (ViewModel). We created another folder to manage the graphical aspect of the application and assignation of routes (View) and finally we created the (Model) folder that organizated corresponding data with Firebase. Other elements and resources found in our repository includes 3rd party dependencies such as SDWebImage, Pods for Cocoapods, Assets in the form of images, and the GoogleService-Info which was our method of attributing a database with Firebase.
```
Grapevine
│   Assets.xcassest                   // A collection of assets for the project
│   GrapevineApp.swift                // The residence of the main method, run upon the initialiation of the app
│   ContentView.swift                 // This is the viewing of the first content that is viewed on the screen to organize the naviagation process. We can see the structure of elements such as the text "Login" ; "Enter phone number" ; and "Verify". The background color is an asset in our "Assets.xcassets" folder.
│   Info.plist                        // Some basic information about the app
│   GoogleService-Info.plist          // Contains properties that are used with firebase. The Firebase database system is to collect contact information like phone numbers, images and more so we can have easier methods of verification, confirmation of correct information, and prevention of misleading statements. We effectively make sure that people give real and honest reviews to truly help others. It is a 3rd party service run under Google meaning it has seamless connection to a majority of modern day profiles. We collect data using the sub-document, collection, and field categories; The categories include data sets of google image apis in the form of imageurl which we get internally and string (text): uid data sets, bio, dataCreated, and username. Posts include string (text) of ref, time, title, and url. We ran this service under license: "Commercial url: https://www.firebase.com/terms/terms-of-service.html" As a credits in the comments.
│   ITC Avant Garde Gothic Bold.otf   // A 3rd party custom font used in the app we have a license consisting of the following requirements: "2. License Grant. You are hereby granted a non-exclusive, non-assignable, non-transferable license (subject to all of the terms and conditions of the Agreement) to (a) embed the Font Software (i) into an iOS, Android or Windows Phone Application, (ii) in a secure manner which does not allow an End User to access the Font Software outside of the Application; and (b) distribute worldwide (subject to the export restrictions set forth in Section 9 of the Terms and Conditions) such Application to End Users. Foundry reserves all rights not expressly granted to you in this Agreement." We meet all the requirements and verified our end of security.
│   SDwebimage Dependencies           // A 3rd party product that allows us to do async image loading, memory/disk caching, and animated image playback and performances for use under our fulfilled license: "Copyright (c) 2009-2020 Olivier Poitrey rs@dailymotion.com Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
│   Cocoapods                         // This is the 1.1% of the Ruby language used in this application. It is an application level dependency manager for Objective-C, Swift and any other languages that run on the Objective-C runtime, such as RubyMotion, that provides a standard format for managing external libraries. We have the license for this as well: "You retain your rights to any Content you submit, post or display on or through the Services. By submitting, posting or displaying Content on or through the Services, you grant us a worldwide, non-exclusive, royalty-free license (with the right to sub-license) to use, copy, reproduce, process, adapt, modify, publish, transmit, display and distribute such Content in any and all media or distribution methods (now known or later developed)."
│
│
└───AI
│   │   Constants.swift               // This file contains configurations for the AIs. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│
│
└───Model
│   │   FetchUser.swift               // This file allows us to utilise the Firebase database and view corresponding data associated with it. This is responsible for fetching the data from the database such as "username" "pic" "bio" and "uid" in the form of "String".
│   │   PostModel.swift               // This file allows us to utilise the Firebase database and import corresponding data associated with it.
│   │   UploadImage.swift             // This file is responsible for using the available images in the Storage and converting them into Firebase api url to view inside the Firebase database.
│   │   UserModel.swift               // This file allows us to utilise the Firebase database and import corresponding data associated with it. We print out the data in the form of "String" onto the database and it can be viewed inside Firebase indentically. This gets updated inside the database.
│   │   AlertView.swift               // This file allows the system to indentify and create a apple system based alert whenever there is an error in the function.
│
│
└───View
│   │   CustomTabbar.swift            // This file is responsible for the visual aspect of the white tabbar that is visible at the bottom of both the PostViewModel and the SettingsViewModel. It includes the components of both "Posts" and "Settings" images and their respective button destination features.
│   │   Home.swift                    // This file is responsible for the visual aspect of the two panels after registering which includes the feed page and the settings page. It includes the background color, text, and framework that is shared between the two panels.
│   │   ImagePicker.swift             // This file is responsible for the functional aspect of choosing an image. In this file, we utilise the third party resource of SDWebImage to retrieve and load. The built in resource also animates and caches the images.
│   │   Login.swift                   // This file is responsible for the visual and functional aspect of the Login page which is the first page seen when loading the application. 
│   │   Logo.swift                    // This file is a null file that was removed from the demonstration. The purpose of the file was originally to provide a seperate visual of the Logo for Grapevine that was centered in the "Home" pages but it was later integrated only in "PostView".
│   │   NewPost.swift                 // This file is responsible for the visual and functional aspect of the post function button after pressing the "square.and.pencil" interactive button. It gives us the freedom to "cancel" or "Post" 
│   │   PostRow.swift                 // This file is responsible for the visual and data loading aspect of the feed panel. It shows different posts and profiles generated from pre-existing users stored in Firebase.
│   │   PostView.swift                // This file is responsible for the visual aspect of the feed panel. It shows visually the string "feed" "No Posts !!!" and images like the Grapevine logo and the "square.and.pencil" image on the screen when applicable. 
│   │   Register.swift                // This file is responsible for the visual and functional aspect of the register panel that prompts if you have a unique unregistered phone number in the Firebase database. It allows you to create a unique name and bio and select a unique profile picture.
│   │   SettingsView.swift            // This file is responsible for the visual and functional aspect of the settings panel, it allows you to edit the contents of your profile including bio, name, and profile picture. It also includes the feature of logging out.
│
│
└───ViewModel                         // All the folders in View wouldn't function without instructions or data in ViewModel, Although some of the comments suggests that files in "View" provide functionality, they are mostly visual files that generate a button that can be funtional under given routes orignating from the ViewModel
│   │   LoginViewModel.swift          // This file uses data from Firebase to create the rules and functions for the Login process that underly elements in corresponding "View"
│   │   NewPostModel.swift            // This file uses data from Firebase to create the rules and functions for the posting process that underly elements in corresponding "View"
│   │   PostViewModel.swift           // This file uses data from Firebase to create the rules and functions for the viewing posts process that underly elements in corresponding "View"
│   │   RegisterViewModel.swift       // This file uses data from Firebase to create the rules and functions for the Register process that underly elements in corresponding "View"
│   │   SettingsViewModel.swift       // This file uses data from Firebase to create the rules and functions for the Settings processes that underly elements in corresponding "View"
│
│
└───Preview Content
    └───Preview Assets.xcassets       // Contains global images used with previews, colors and the Logo.
```

## FBLA Guidelines
- [x] The app must be rated for all ages
- [x] Packaged with complete file, README, and instructions : contains README with usage instructions as well as info page on startup
- [x] Application Functionality : application can be launched in iPhone and iPad
- [x] Documentation and Copyright Compliance : all license information is included in each directory
- [x] Application addresses the topic/problem : application is a social media app
- [x] Planning Process : planning is thoroughy described in presentation
- [x] Navigation : navigation is intuitive
- [x] Code : code contains commentary and is written in a logical order as explained in structure
- [x] Icon and Graphics : graphics are consistent with logo color scheme, and logo is shown on iPhone home screen
- [x] Social Media : the app is connected to Google firebase
- [x] Bugs : no bugs have been observed, and bugs can be reported through GitHub

## Licensing
All of the 3rd party resources we used are under perpetual or circumstantial licenses which are all met in our current condition of the application. Any images used in the application are copyright free under the creative commons license and they are not real people. The two inanimate pictures used were taken personally. Symbols are all licensed inside Xcode.

BertQA capabilities (located in the file system as BertQACore) are used under the Apache License Version 2.0. Consistently with the requests of the license, a copy is included in the top level of the BertQACore folder, and all copyright headers in the used files are maintained.

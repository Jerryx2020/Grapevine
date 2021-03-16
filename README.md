# Grapevine
an app for sharing workplace experiences

## Usage

## Purpose
Expanding the range of sharing job experience is our purpose for this app. When people are coming into jobs, they aren’t able to gain any first-hand physical experience through shadowing or other types of interning in person. When a person wants to get a job, due to the extremely high unemployment rate and demand for them, they need to be extremely knowledgeable about that job and what it holds for them, as there isn’t much job-to-job mobility at all. Choosing a job without any experience can be very dangerous, and could put people in worse situations. They need to have a general sense of what they can expect, as oftentimes, people have trouble admitting that there is a problem with something that they have. High schoolers would be very benefitting from the college campus and class experience. There are no detailed tours and guidance is very limited. We need an app that allows information to be shared. We need to make sure that people give real and honest reviews, so people aren’t misled, and they get the experience that they need.

## Project Structure
```
Grapevine
│   Assets.xcassest //a collection of assets for the project
│  
|   GrapevineApp.swift //the residence of the main method, run upon the initialiation of the app
|
|   ContentView.swift // This is the viewing of the first content that is viewed on the screen to organize the naviagation process. We can see the structure of elements such as the text "Login" ; "Enter phone number" ; and "Verify". The background color is an asset in our "Assets.xcassets" folder.
|
|   Info.plist //some basic information about the app
│   
|   GoogleService-Info.plist //contains properties that are used with firebase. The Firebase database system is to collect contact information like phone numbers, images and more so we can have easier methods of verification, confirmation of correct information, and prevention of misleading statements. We effectively make sure that people give real and honest reviews to truly help others. It is a 3rd party service run under Google meaning it has seamless connection to a majority of modern day profiles. We collect data using the sub-document, collection, and field categories; The categories include data sets of google image apis in the form of imageurl which we get internally and string (text): uid data sets, bio, dataCreated, and username. Posts include string (text) of ref, time, title, and url. We ran this service under license: "Commercial
url: https://www.firebase.com/terms/terms-of-service.html" As a credits in the comments.
│    
|   ITC Avant Garde Gothic Bold.otf //a 3rd party custom font used in the app we have a license consisting of the following requirements: "2. License Grant. You are hereby granted a non-exclusive, non-assignable, non-transferable license (subject to all of the terms and conditions of the Agreement) to (a) embed the Font Software (i) into an iOS, Android or Windows Phone Application, (ii) in a secure manner which does not allow an End User to access the Font Software outside of the Application; and (b) distribute worldwide (subject to the export restrictions set forth in Section 9 of the Terms and Conditions) such Application to End Users. Foundry reserves all rights not expressly granted to you in this Agreement." We meet all the requirements and verified our end of security.

│   SDwebimage Dependencies // A 3rd party product that allows for use under our fulfilled license: "Copyright (c) 2009-2020 Olivier Poitrey rs@dailymotion.com Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
|
|   Cocoapods // This is the 1.1% of the Ruby language used in this application. It is an application level dependency manager for Objective-C, Swift and any other languages that run on the Objective-C runtime, such as RubyMotion, that provides a standard format for managing external libraries. We have the license for this as well: "You retain your rights to any Content you submit, post or display on or through the Services. By submitting, posting or displaying Content on or through the Services, you grant us a worldwide, non-exclusive, royalty-free license (with the right to sub-license) to use, copy, reproduce, process, adapt, modify, publish, transmit, display and distribute such Content in any and all media or distribution methods (now known or later developed)."
|
|   All of the 3rd party resources we used are under perpetual or circumstantial licenses which are all met in our current condition of the application. Any images used in the application are copyright free under the creative commons license and they are not real people. The two inanimate pictures used were taken personally.
│
└───Model
│   │   FetchUser.swift //This file allows us to utilise the firebase database and import corresponding data associated with it, 
│   │   PostModel.swift //
│   │   UploadImage.swift //
│   │   UserModel.swift //
│   
└───View
│   │   CustomTabbar.swift //
│   │   Home.swift //
│   │   ImagePicker.swift //
│   │   Login.swift //
│   │   Logo.swift //
│   │   NewPost.swift //
│   │   PostRow.swift //
│   │   PostView.swift //
│   │   Register.swift //
│   │   SettingsView.swift //
│
└───ViewModel
│   │   LoginViewModel.swift //
│   │   NewPostModel.swift //
│   │   PostViewModel.swift //
│   │   RegisterViewModel.swift //
│   │   SettingsViewModel.swift //
│
└───Preview Content
    └───Preview Assets.xcassets //contains global images used with previews

```

## FBLA Guidelines
- [x] The app must be rated for all ages
- [x] Packaged with complete file, readme, and instructions : contains README with usage instructions
- [x] Application functionality : application can be launched in iPhone and iPad
- [x] Documentation and copyright compliance : all license information is included in each directory
- [x] Application addresses the topic/problem : application is a social media app
- [x] Planning process : planning is thoroughy described in presentation
- [x] Navigation : navigation is intuitive
- [x] Code : code contains commentary and is written in a logical order as explained in structure
- [x] Icon and graphics : graphics are consistent with logo color scheme, and logo is shown on iPhone home screen
- [x] Social media : the app can connect with Google firebase
- [x] Bugs : no bugs have been observed, and bugs can be reported through GitHub

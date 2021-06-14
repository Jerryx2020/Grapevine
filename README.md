# Grapevine
An app for sharing workplace experiences

## Installation
When installing on macOS to run in Xcode, one must install all dependencies with Cocoapods.

First, navigate to the location of the project in the file system using `cd`.

Then, if it is not already installed, install Cocoapods with `sudo gem install cocoapods`.

Then, run the following (ommitting `$`):
```
$ pod deintegrate
$ pod install
$ pod update
```

## Usage
Upon first launch, the user may take two routes: use an existing profile associated with a phone number or use a new phone number in the database. On the login screen, the first entry box accepts a country code, and the second, the remainder of the phone number. Pressing verify performs authentication and unlocks the app. The user may also enter a phone number that is not associated with a profile. This brings the user to the Register page.

The main part of the app is the Feed. Scrolling will allow the user to view existing posts. Clicking the button at the top right will allow the user to post. The user can, then, enter text and select an image to post. After posting, a user may also delete or edit their post by clicking the three dots. Using the settings screen, the user may update their profile image, name, bio, and the user may also logout.

## Purpose
We built Grapevine to make taking a new job more predictable. We try to do so by allowing people to share their experiences from the workplace. When taking a job, one should know what to expect, but, often, they aren’t able to gain any first-hand physical experience through shadowing or other types of interning in person. Grapevine gives people peace of mind by creating a more transparent workplace.

## Project Structure
We designed Grapevine's file structure to be intuitive and elegant. In this design, as one goes deeper into the file structure, files become less abstract.

Like files are grouped together. Folders for data retrieval are located in the ViewModel folder; graphical aspects, View; database managers, Model; and artificial intelligence features, AI.

The app also makes use of 3rd party dependencies such as SDWebImage, Cocoapods, and the GoogleService-Info. These dependencies retrieve web images, manage AI and database libraries, and coordinate with our Firebase database, respectively.
```
Grapevine
│   Assets.xcassest                                    // This package contains a collection of assets for the project
│   GrapevineApp.swift                                 // This file is the residence of the main method, run upon the initialiation of the app
│   ContentView.swift                                  // This file contains the implementation of the main screens, including the viewing of the first content that is viewed on the screen to organize the naviagation process. We can see the structure of elements such as the text "Login" ; "Enter phone number" ; and "Verify". The background color is an asset in our "Assets.xcassets" folder.
│   Info.plist                                         // This file contains some basic information about the app
│   GoogleService-Info.plist                           // This file contains properties that are used with firebase. The Firebase database system is to collect contact information like phone numbers, images and more so we can have easier methods of verification, confirmation of correct information, and prevention of misleading statements. We effectively make sure that people give real and honest reviews to truly help others. It is a 3rd party service run under Google meaning it has seamless connection to a majority of modern day profiles. We collect data using the sub-document, collection, and field categories; The categories include data sets of google image apis in the form of imageurl which we get internally and string (text): uid data sets, bio, dataCreated, and username. Posts include string (text) of ref, time, title, and url. We ran this service under license: "Commercial url: https://www.firebase.com/terms/terms-of-service.html" As a credits in the comments.
│   ITC Avant Garde Gothic Bold.otf                    // A 3rd party custom font used in the app we have a license consisting of the following requirements: "2. License Grant. You are hereby granted a non-exclusive, non-assignable, non-transferable license (subject to all of the terms and conditions of the Agreement) to (a) embed the Font Software (i) into an iOS, Android or Windows Phone Application, (ii) in a secure manner which does not allow an End User to access the Font Software outside of the Application; and (b) distribute worldwide (subject to the export restrictions set forth in Section 9 of the Terms and Conditions) such Application to End Users. Foundry reserves all rights not expressly granted to you in this Agreement." We meet all the requirements and verified our end of security.
│   SDwebimage Dependencies                            // A 3rd party product that allows us to do async image loading, memory/disk caching, and animated image playback and performances for use under our fulfilled license: "Copyright (c) 2009-2020 Olivier Poitrey rs@dailymotion.com Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
│   Cocoapods                                          // This is an application level dependency manager for Objective-C, Swift and any other languages that run on the Objective-C runtime, such as RubyMotion, that provides a standard format for managing external libraries. We have the license for this as well: "You retain your rights to any Content you submit, post or display on or through the Services. By submitting, posting or displaying Content on or through the Services, you grant us a worldwide, non-exclusive, royalty-free license (with the right to sub-license) to use, copy, reproduce, process, adapt, modify, publish, transmit, display and distribute such Content in any and all media or distribution methods (now known or later developed)."
│
└───AI
│   │   Constants.swift                                // This file contains configurations for the AIs. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │
│   └───QA
│   │   QAHandler.swift                                // This file contains the high-level wrapper of the question answering utilities implemented in the Grapevine search
│   │
│   └───BertQACore
│   │   │    LICENSE                                   // This file contains the license for all software written by The TensorFlow Authors used in this project
│   │   │
│   │   └───Extensions
│   │   │   │   DataExtension.swift                    // This file contains extensions of the Data type that allows for further Arithmetic capabilities of Arrays. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   StringExtension.swift                  // This file contains extenstions of the String type that add utilities for tokenization. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   UnicodeScalarExtension.swift           // This file contains extensions of UnicodeScalar objects that allow for text cleaning for AI. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │
│   │   │
│   │   └───Models
│   │   │   │   Dataset.swift                          // This file contains utilities for downloading AI datasets used for the model. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   FileLoader.swift                       // This file contains a utility for loading model vocabulary files. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │
│   │   │   └───ML
│   │   │   │   BertQAHandler.swift                    // This file contains a high level interface to the question answering model that is abstracted further in QAHandler.swift. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   ContentData.swift                      // This file contains utilities for extracting words from string. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   InputFeatures.swift                    // This file contains a data structure for input to the question answering model. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   Result.swift                           // This file contains a data structure for question answering model output. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │
│   │   │   └───Tokenizers
│   │   │   │   BasicTokenizer.swift                   // This file contains data preprocessing tools for question answering model input. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   FullTokenizer.swift                    // This file contains data preprocessing tools for question answering model input. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   WordpieceTokenizer.swift               // This file contains data preprocessing tools for question answering model input. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │
│   │   │
│   │   └───Resources
│   │   │   │   contents_from_squad_dict_format.json   // This file contains training data for the AI model. This file was compiled by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   mobilebert_float_20191023.tflite       // This file contains the trained question answering model. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │   vocab.txt                              // This file contains the full vocabulary utilized by the question answering model. This file was written by The TensforFlow Authors, and is used under the Apache 2.0 License. For details see the Licensing section of this document.
│   │   │   │
│   │   │
│   │
│
└───Model
│   │   FetchUser.swift                                // This file allows us to utilise the Firebase database and view corresponding data associated with it. This is responsible for fetching the data from the database such as "username" "pic" "bio" and "uid" in the form of "String".
│   │   PostModel.swift                                // This file allows us to utilise the Firebase database and import corresponding data associated with it.
│   │   UploadImage.swift                              // This file is responsible for using the available images in the Storage and converting them into Firebase api url to view inside the Firebase database.
│   │   UserModel.swift                                // This file allows us to utilise the Firebase database and import corresponding data associated with it. We print out the data in the form of "String" onto the database and it can be viewed inside Firebase indentically. This gets updated inside the database.
│   │   AlertView.swift                                // This file allows the system to indentify and create a apple system based alert whenever there is an error in the function.
│   │
│
└───View
│   │   CustomTabbar.swift                             // This file is responsible for the visual aspect of the white tabbar that is visible at the bottom of both the PostViewModel and the SettingsViewModel. It includes the components of both "Posts" and "Settings" images and their respective button destination features.
│   │   Home.swift                                     // This file is responsible for the visual aspect of the two panels after registering which includes the feed page and the settings page. It includes the background color, text, and framework that is shared between the two panels.
│   │   ImagePicker.swift                              // This file is responsible for the functional aspect of choosing an image. In this file, we utilise the third party resource of SDWebImage to retrieve and load. The built in resource also animates and caches the images.
│   │   Login.swift                                    // This file is responsible for the visual and functional aspect of the Login page which is the first page seen when loading the application. 
│   │   Logo.swift                                     // This file is a null file that was removed from the demonstration. The purpose of the file was originally to provide a seperate visual of the Logo for Grapevine that was centered in the "Home" pages but it was later integrated only in "PostView".
│   │   NewPost.swift                                  // This file is responsible for the visual and functional aspect of the post function button after pressing the "square.and.pencil" interactive button. It gives us the freedom to "cancel" or "Post" 
│   │   PostRow.swift                                  // This file is responsible for the visual and data loading aspect of the feed panel. It shows different posts and profiles generated from pre-existing users stored in Firebase.
│   │   PostView.swift                                 // This file is responsible for the visual aspect of the feed panel. It shows visually the string "feed" "No Posts !!!" and images like the Grapevine logo and the "square.and.pencil" image on the screen when applicable. 
│   │   Register.swift                                 // This file is responsible for the visual and functional aspect of the register panel that prompts if you have a unique unregistered phone number in the Firebase database. It allows you to create a unique name and bio and select a unique profile picture.
│   │   SettingsView.swift                             // This file is responsible for the visual and functional aspect of the settings panel, it allows you to edit the contents of your profile including bio, name, and profile picture. It also includes the feature of logging out.
│   │   UserView.swift                                 // This file is responsible for the visual and functional aspect of the user dialog when a user is pressed on the feed.
│   │
│
└───ViewModel                                          // All the folders in View wouldn't function without instructions or data in ViewModel, Although some of the comments suggests that files in "View" provide functionality, they are mostly visual files that generate a button that can be funtional under given routes orignating from the ViewModel
│   │   LoginViewModel.swift                           // This file uses data from Firebase to create the rules and functions for the Login process that underly elements in corresponding "View"
│   │   NewPostModel.swift                             // This file uses data from Firebase to create the rules and functions for the posting process that underly elements in corresponding "View"
│   │   PostViewModel.swift                            // This file uses data from Firebase to create the rules and functions for the viewing posts process that underly elements in corresponding "View"
│   │   RegisterViewModel.swift                        // This file uses data from Firebase to create the rules and functions for the Register process that underly elements in corresponding "View"
│   │   SettingsViewModel.swift                        // This file uses data from Firebase to create the rules and functions for the Settings processes that underly elements in corresponding "View"
│   │
│
└───Preview Content
    └───Preview Assets.xcassets                        // This file ontains global images used with previews, colors and the Logo.
```

## FBLA Guidelines
- [x] The app must be rated for all ages
- [x] Packaged with complete file, README, and instructions : contains README with usage instructions as well as info page on startup
- [x] Application Functionality : application can be launched on iPhone, and an Android version is included
- [x] Documentation and Copyright Compliance : all license information is included in the code as well as in README.md
- [x] Application addresses the topic/problem : application is a social media app
- [x] Planning Process : planning is thoroughy described in presentation and user guide
- [x] Navigation : navigation is intuitive and described in README.md
- [x] Code : code contains commentary and is arranged logically, as explained in Project Structure
- [x] Icon and Graphics : graphics are consistent with logo color scheme, and logo is shown on device home screen
- [x] Social Media : the app is connected to Google Firebase and makes use of a Social Media design
- [x] Bugs : no bugs have been observed, and future bugs can be reported through GitHub

## Licensing
All 3rd party resources are used under perpetual or circumstantial licenses, and their conditions are all met. Any images used in the application are used under the Creative Commons license and are not of real people. The two landscape pictures used were taken personally and the rights to the images are maintained. System symbols are licensed for free developer use by Apple.

BertQA capabilities (located in the file system as BertQACore) are used under the Apache License Version 2.0. Consistently with the terms of the license, a copy is included in the top level of the BertQACore folder, and all copyright headers in the used files are maintained.

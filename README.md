# Grapevine
an app for sharing workplace experiences

## Usage

## Purpose

## Project Structure
```
FBLA
│   Assets.xcassest //a collection of assets for the project
│   FBLA.entitlements //a collection of permissions requested by the app
│   FBLAApp.swift //the residence of the main method, run upon the initialiation of the app
│   Info.plist //some basic information about the app
│
└───Data
│   │   DataHandle.swift //a set of structures and functions that handle the loading and management of question data
│   │
│   └───Questions
│       │   MatchQuestions.json //a list of 10 matching questions that are loaded into the program
│       │   MultipleChoiceQuestions.json //a list of 10 multiple choice questions that are loaded into the program
│       │   NumberQuestions.json //a list of 10 number questions that are loaded into the program
│       │   OrderingQuestions.json //a list of 10 ordering questions that are loaded into the program
│       │   ShortAnswerQuestions.json //a list of 10 short answer questions that are loaded into the program
│   
└───High Level Views
│   │   ContentView.swift //a set of important extensions and data structures that help with views and other GUI and functional elements
│   │   QuestionView.swift //the implementation of each question type and the report types into the GUI presented to the user
│
└───Low Level Views
│   │   QuestionTypes.swift //the design of each type of question that are then implemented by QuestionView.swift
│   │   ReportView.swift //the design of each type of report that are then implemented by QuestionView.swift
│   │   
│   └───Components
│       │   MatchingComponents.swift //the elements of a matching question design that are assembled in QuestionTypes.swift
│       │   MultipleChoiceComponents.swift //the elements of a multiple choice question design that are assembled in QuestionTypes.swift
│       │   NumberComponents.swift //the elements of a number question design that are assembled in QuestionTypes.swift
│       │   OrderingComponents.swift //the elements of an ordering question design that are assembled in QuestionTypes.swift
│       │   ShortAnswerComponents.swift //the elements of a short answer question design that are assembled in QuestionTypes.swift
│
└───Preview Content
    └───Preview Assets.xcassets //an unimplemented set of assets to use for previews when developing in Xcode

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

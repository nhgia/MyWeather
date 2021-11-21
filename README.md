# MyWeather
A simple Weather app that retrieves information of real-time weather forecast.

#### About the author:
My name is Gia Nguyen. If you have any question or further information, feel free to contact me by **nhgia.apcs(at)gmail.com** and/or [LinkedIn](https://www.linkedin.com/in/nhgia/).


### Prerequisite
- XCode 13.1+
- Simulator with iOS 14+

### Practices applied into the Application
- This application using the MVVM with a little bit of Clean Architecture. <br/>
- Other design patterns: Singleton, Dependency Injection.

### Source code structure, libraries, and frameworks
- The structure of the project can be listed as below:
```swift
.
├── MyWeather
│   ├── Application	// Anything related to the core of the App
│   │   ├── Base		// Contains AppDelegate (or @main App in SwiftUI)
│   │   └── Config		// Any client configuration
│   │       ├── Info.plist
│   │       ├── Production.xcconfig	// Server url, bundleID, app name, app version
│   │       ├── Sandbox.xcconfig	// Same, to seperate different app's variants
│   │       └── Config.swift		// API Key(s), default values
│   ├── Infrastructure	// Handle network tasks, enums, high severity methods
│   ├── Modules		// Any feature will be implemented here
│   │   └── <Any module name>
│   │       ├── Model
│   │       ├── View
│   │       └── ViewModel
│   ├── Resources
│   │   ├── Assets.xcassets	// Local images/assets
│   │   └── Localizable		// String files for multi-language
│   └── Utilities
│       └── Extensions		// Extend types
├── MyWeather.xcodeproj
├── MyWeatherTests	// Contains unit tests for any modules
└── README.md		// This file

```
- External libraries: Alamofire (for network tasks) and Kingfisher (for image loading & caching). Install via Swift Package Manager (SPM).
- UI framework is SwiftUI. It is fast, modern, and easy to implement. Dark mode supported.

### How to run the Application
1. Please kindly download/clone the repo. <br/>
2. Open the file ```MyWeather.xcodeproj``` with Xcode 13.1+. <br/>
3. After launching the project, please wait SPM fetching all the libraries. You can find the progess at the bottom left of Xcode's project navigator. After fetching successfully, the "Package Dependencies" section should look like this figure below.
<p align="center">
    <img width="40%" src="https://user-images.githubusercontent.com/40845574/142769320-d466c25d-0c10-4975-9f9c-39fef41511b3.png">
</p>
4. Press Command + R or click the Play button to run the application. Please choose a simulator with iOS 14 or higher. The default build configuration is "Sandbox", simulates the environment for developing. You can change it in the "Edit scheme" to either "Sandbox" or "Production".
<p align="center">
    <img width="80%" src="https://user-images.githubusercontent.com/40845574/142770000-4982ba44-9f1c-4854-8166-b16865da5bc7.png">

### Checklist
- [x] Programming language: Swift.
- [x] Design app's architecture: MVVM
- [x] Application UI looks like prototype.
- [x] Unit tests
- [x] Exception handling
- [x] Readme file

### Screenshots
<p align="center">
	<img width="24%" src="https://user-images.githubusercontent.com/40845574/142758796-9a9cf86b-37ee-4948-b3a1-7a955935dca7.png">
    <img width="24%" src="https://user-images.githubusercontent.com/40845574/142758790-ed52ebc2-4d88-4b00-ae5d-e8389b91a877.png">
	<img width="24%" src="https://user-images.githubusercontent.com/40845574/142758792-7a170541-a5cf-4105-90ae-22a6f084d016.png">
	<img width="24%" src="https://user-images.githubusercontent.com/40845574/142758794-254fb1c1-7ddc-46e0-8e82-fe5af6d0bb3b.png">

</p>
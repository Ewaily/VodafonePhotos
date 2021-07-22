# VodafonePhotos


## _VodafonePhotos is an iOS application built as interview task at Vodafone Group Services Limited. Built Using MVVM (Model-View-ViewModel) and Clean Architecture concepts_


[![Build Status](https://github.com/KarimEbrahemAbdelaziz/SwiftyMenu/workflows/Build/badge.svg)]() [![Build Status](https://img.shields.io/badge/Swift-5.2-orange.svg)]() [![Build Status](http://img.shields.io/badge/Cocoapods-available-green.svg?style=flat)]()

VodafonePhotos is an iOS mobile app that display list of photos queried from a public API and much more..


# Features

- Lists photos queried from a public API
- Handle API Pagination 
- Display advertisement placeholder after every 5 photos
- Details screen for each retrieved photo displays the author name and the image
- Zoom In & Out the image in the details
- Adjust the details screen background color according to the most dominant color of
the selected photo
- Support both orientations portrait and landscape
- Pull to refresh in offline mode
- Cache maximum of 20 items, so the app could work in offline mode
- Unit tests for the ViewModels
- Mixing between Swift and Objective-C in the (Connection Reachability Manager)
- Supports iOS 11.0 and later

# Demo
![VodafonePhotos Online Mode](README_Resources/online_mode.gif) ![VodafonePhotos Offline Mode](README_Resources/offline_mode.gif) 

# Installation
Check out to development branch
#### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. 
or simply do this 👇
```sh
$ sudo gem install cocoapods
```

Install the dependencies and devDependencies and run via **`VodafonePhotos.xcworkspace`** -

```sh
cd VodafonePhotos/VodafonePhotos 
$ pod install
```


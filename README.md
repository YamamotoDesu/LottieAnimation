# LottieAnimation-Swift

![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg)  

## Context  
A Lottie is a JSON-based animation file format that enables designers to ship animations on any platform as easily as shipping static assets. 

## Requirement
- Xcode Version 12.4 (12D4e)
- Swift 5
- lottie-ios 3.15

## Image
![demo](https://github.com/YamamotoDesu/LottieAnimation-Swift/blob/main/RocketSim%20Recording%20-%20iPhone%2012%20-%202021-07-23%2020.11.14.gif)  
<br><br>

#### Sample Code
```swift
        let ufoAnimationView: AnimationView = AnimationView(name: "61191-ufos")
        
        // Play the animation
        ufoAnimationView.play()
        
        // Set animation loop mode
        ufoAnimationView.loopMode = .loop
        
        // Add animationView as subview
        self.view.addSubview(ufoAnimationView)
```

## Installation
https://github.com/airbnb/lottie-ios

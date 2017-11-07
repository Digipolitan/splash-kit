SplashKit
=================================

[![Swift Version](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Build Status](https://travis-ci.org/Digipolitan/dependency-injector.svg?branch=master)](https://travis-ci.org/Digipolitan/splash-kit)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SplashKit.svg)](https://img.shields.io/cocoapods/v/SplashKit.svg)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/SplashKit.svg?style=flat)](http://cocoadocs.org/docsets/SplashKit)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

Customizable splash screen system wich can handle multiple splash navigation and display

## Installation

### CocoaPods

To install SplashKit with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'SplashKit'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SplashKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github 'Digipolitan/splash-kit ~> 1.0
```

Run `carthage update` to build the framework and drag the built `SplashKit.framework` into your Xcode project.

## The Basics

### Default Splash

First add the key **environment** into your **Info.plist**, check the [RuntimeEnvironment](https://github.com/Digipolitan/runtime-environment) repository.

```xml
<key>environment</key><string>staging</string>
```

Then create your splashscreen view (.xib) and make it inherit from **DefaultSplashScreenViewController** and set your splashscreen actions on **AppDelegate.swift** like follow

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = SplashNavigationController.newInstance(splashViewControllers:
        DefaultSplashViewController(nibName: "AppDefaultSplashViewController", bundle: nil)) { [weak self] _ in
            guard let target = self,
                let window = target.window else {
                    return
            }
            UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve, animations: {
                UIView.setAnimationsEnabled(false)
                window.rootViewController = UINavigationController(rootViewController: ViewController())
                UIView.setAnimationsEnabled(true)
            }, completion: nil)
        }
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
```

This is an example of using the default splash.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

SplashKit is licensed under the [BSD 3-Clause license](LICENSE).

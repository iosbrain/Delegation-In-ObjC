# Tutorial: delegates and delegation in Objective-C (Delegation-In-ObjC)
This is a project (Xcode 9) demonstrating delegates/delegation in iOS with Objective-C. I create a simple delegate for a user interface class (think UICollectionViewDelegate). Go to my article, [Tutorial: delegates and delegation in Objective-C](http://iosbrain.com/blog/2018/02/01/tutorial-delegates-and-delegation-in-objective-c/), and we'll discuss the following:

I'm going to talk about "delegates" and "delegation." I'll lead you through a simple example of implementing the delegation design pattern in Objective-C, with full source code (here), and then show you a more sophisticated scenario. My intent here is to show you how delegation works without getting bogged down in some crazy complex example.

I'll show you how to build a user interface (UI) component, a status/progress indicator, which you can display on screen for processing-intensive tasks... AND I'll show you how you can customize the behavior of the indicator by using delegation. For example, when the indicator starts, you could disable your UI; when the indicator stops, you could re-enable your UI; and, when the user taps the indicator, you could cancel processing-intensive tasks. Here’s the app we'll build:

![alt text][logo]

[logo]: http://iosbrain.com/wp-content/uploads/2018/02/statusWheel.gif "App demonstrating delegation"

## Xcode 9 project settings
**To get this project running on the Simulator or a physical device (iPhone, iPad)**, go to the following locations in Xcode and make the suggested changes:

1. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Signing
- [ ] Tick the "Automatically manage signing" box
- [ ] Select a valid name from the "Team" dropdown
  
2. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Identity
- [ ] Change the "com.yourDomainNameHere" portion of the value in the "Bundle Identifier" text field to your real reverse domain name (i.e., "com.yourRealDomainName.Project-Name").

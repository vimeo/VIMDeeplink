Open With Vimeo
==================
A helper library to view a user or video with the official Vimeo iOS App. Supports both [Swift](https://developer.apple.com/swift/) and [Objective C](https://developer.apple.com/library/mac/documentation/cocoa/conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html).


# Contents
 - [Installation](#installation)
 - [Play a video](#play-a-video)
 - [View a user](#view-a-user)
 - [Restrictions](#restrictions)
 - [Reference](#reference)
  - [View app in the App store](#open-app-in-the-app-store)
  - [Check if the Vimeo app is installed](#check-if-the-vimeo-app-is-installed)
  - [Open the Vimeo app](#open-the-vimeo-app)
  - [View a video in the Vimeo app](#view-a-video-in-the-vimeo-app)
  - [View a user profile in the Vimeo app](#view-a-user-in-the-vimeo-app)

# Installation
1. [Download this repo](https://github.com/vimeo/VimeoAppClient-iOS/archive/master.zip).
2. Drop either the objc .h/.m files or the .swift file into your project.

# Play a video

If you want to play a Vimeo video on iOS, there are currently three choices.

1. You can open the video in the Vimeo application using this library or by opening vimeo://{user-uri} or vimeo://{video-uri} links with [openURL](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UIApplication_Class/index.html#//apple_ref/occ/instm/UIApplication/openURL:).
2. You can embed the video in a web view. See our [embed documentation](https://developer.vimeo.com/apis/oembed) for more.
3. PRO members can generate direct video file links for their own players. See our [API documentation](https://developer.vimeo.com/api) for more.

If you wish to use this library, you must make sure your user has the Vimeo app installed. We expose a [method](#check-if-the-vimeo-app-is-installed) to verify this. If the app is not installed, you can send your users to the [app store](#open-app-in-the-app-store).

If the user has the app installed, you can open the video. First you must find your video's URI. This is the unique identifier provided by the Vimeo API. You can learn more at the [developer site](https://developer.vimeo.com/api). We will release an iOS API library in the future, but for the moment I recommend starting with an OAuth 2 library and working from there.

Once you have your video's URI, you can pass it into the [proper method](#view-a-video-in-the-vimeo-app) and the Vimeo app will open to your video.

# View a user

First you must make sure your user has the Vimeo app installed. We expose a [method](#check-if-the-vimeo-app-is-installed) to verify this. If the app is not installed, you can send your users to the [app store](#open-app-in-the-app-store).

Once the app is installed, find your user's URI. This is the unique identifier provided by the Vimeo API. You can learn more at the [developer site](https://developer.vimeo.com/api). We will release an iOS API library in the future, but for the moment I recommend starting with an OAuth 2 library and working from there.

Once you have your user's URI, you can pass it into the [proper method](#view-a-user-in-the-vimeo-app) and the Vimeo app will open to your user.

# Restrictions
 - The Vimeo app must be installed on your user's device. You can verify this with the [proper method](#check-if-the-vimeo-app-is-installed).
 - Your user must be logged into Vimeo app to view videos.

# Reference

## Open app in the App store

#### Swift
`let success = VimeoAppClient.viewVimeoAppInAppStore()`

#### Objective C
`BOOL success = [VimeoAppClient viewVimeoAppInAppStore];`


## Check if the Vimeo app is installed

#### Swift
`let success = VimeoAppClient.isVimeoAppInstalled()`

#### Objective C
`BOOL success = [VimeoAppClient isVimeoAppInstalled];`

## Open the Vimeo app

#### Swift
`let success = VimeoAppClient.openVimeoApp()`

#### Objective C
`BOOL success = [VimeoAppClient openVimeoApp];`

## View a video in the Vimeo app

This is a wrapper around the [openURL](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UIApplication_Class/index.html#//apple_ref/occ/instm/UIApplication/openURL:) method. You must provide a video uri to this method. You can find a video's uri by making an API call to our [video endpoints](https://developer.vimeo.com/api/endpoints/videos#/{video_id}).

#### Swift
`let success = VimeoAppClient.showVideo(videoURI: "...")`

#### Objective C
`BOOL success = [VimeoAppClient showVideoWithURI:@"..."]; // URI obtained via the Vimeo API`

## View a user in the Vimeo app

This is a wrapper around the [openURL](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UIApplication_Class/index.html#//apple_ref/occ/instm/UIApplication/openURL:) method. You must provide a user uri to this method. You can find a user's uri by making an API call to our [user endpoints](https://developer.vimeo.com/api/endpoints/users#/{user_id}).

#### Swift
`let success = VimeoAppClient.showUser(userURI: "...")`

#### Objective C
`BOOL success = [VimeoAppClient showUserWithURI:@"..."];`


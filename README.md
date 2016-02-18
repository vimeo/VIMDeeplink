Open With Vimeo
==================
A helper class to view a user profile or video with the official Vimeo iOS App. Supports both [Swift](https://developer.apple.com/swift/) and [Objective C](https://developer.apple.com/library/mac/documentation/cocoa/conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html).


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
  - [View a category in the Vimeo app](#view-a-category-in-the-vimeo-app)
  - [View a channel in the Vimeo app](#view-a-channel-in-the-vimeo-app)
  - [Open the all categories page](#open-the-all-categories-page)
  - [Open the Explore tab](#open-the-explore-tab)
  - [Open the Feed tab](#open-the-feed-tab)
  - [Open the Playlists tab](#open-the-playlists-tab)
  - [Open the Camera Roll](#open-the-camera-roll)
  - [Open the current user's profile](#open-the-current-users-profile)

# Installation
1. [Download this repo](https://github.com/vimeo/VIMDeeplink/archive/master.zip).
2. Drop either the objc .h/.m files or the .swift file into your project.

# Play a video

If you want to play a Vimeo video on iOS, there are currently three choices.

1. You can open the video in the Vimeo application using this library or by opening `vimeo://app.vimeo.com/{user_uri}` or `vimeo://app.vimeo.com/{video_uri}` links with [openURL](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UIApplication_Class/index.html#//apple_ref/occ/instm/UIApplication/openURL:).  Note that video and user URIs are of the form `/videos/12345` and `/users/12345` respectively.
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

The Vimeo deeplink base URL is: `vimeo://app.vimeo.com`

Currently supported paths are `vimeo://app.vimeo.com/videos/12345` where `/videos/12345` is a video URI and `vimeo://app.vimeo.com/users/12345` where `/users/12345` is a user URI.

## Open app in the App store

#### Swift
`let success = VIMDeeplink.viewVimeoAppInAppStore()`

#### Objective C
`BOOL success = [VIMDeeplink viewVimeoAppInAppStore];`


## Check if the Vimeo app is installed

#### Swift
`let success = VIMDeeplink.isVimeoAppInstalled()`

#### Objective C
`BOOL success = [VIMDeeplink isVimeoAppInstalled];`

## Open the Vimeo app

#### Swift
`let success = VIMDeeplink.openVimeoApp()`

#### Objective C
`BOOL success = [VIMDeeplink openVimeoApp];`

## View a video in the Vimeo app

You must provide a video uri to this method. You can find a video's uri by making an API call to our [video endpoints](https://developer.vimeo.com/api/endpoints/videos#/{video_id}).

#### Swift
`let success = VIMDeeplink.showVideo(videoURI: "...")`

#### Objective C
`BOOL success = [VIMDeeplink showVideoWithURI:@"..."]; // URI obtained via the Vimeo API`

## View a user in the Vimeo app

You must provide a user uri to this method. You can find a user's uri by making an API call to our [user endpoints](https://developer.vimeo.com/api/endpoints/users#/{user_id}).

#### Swift
`let success = VIMDeeplink.showUser(userURI: "...")`

#### Objective C
`BOOL success = [VIMDeeplink showUserWithURI:@"..."];`

## View a category in the Vimeo app

You must provide a category uri to this method. You can find a category's uri by making an API call to our [category endpoints](https://developer.vimeo.com/api/endpoints/categories).

#### Swift
`let success = VIMDeeplink.showCategory(categoryURI: "...")`

#### Objective C
`BOOL success = [VIMDeeplink showCategoryWithURI:@"..."];`

## View a channel in the Vimeo app

You must provide a channel uri to this method. You can find a channel's uri by making an API call to our [channel endpoints](https://developer.vimeo.com/api/endpoints/channels).

#### Swift
`let success = VIMDeeplink.showChannel(userURI: "...")`

#### Objective C
`BOOL success = [VIMDeeplink showChannelWithURI:@"..."];`

## Open the all categories page

#### Swift
`let success = VIMDeeplink.showAllCategories()`

#### Objective C
`BOOL success = [VIMDeeplink showAllCategories];`

## Open the Explore tab

#### Swift
`let success = VIMDeeplink.showExplore()`

#### Objective C
`BOOL success = [VIMDeeplink showExplore];`

## Open the Feed tab

#### Swift
`let success = VIMDeeplink.showFeed()`

#### Objective C
`BOOL success = [VIMDeeplink showFeed];`

## Open the Playlists tab

#### Swift
`let success = VIMDeeplink.showPlaylists()`

#### Objective C
`BOOL success = [VIMDeeplink showPlaylists];`

## Open the Upload from camera roll view

#### Swift
`let success = VIMDeeplink.showUpload()`

#### Objective C
`BOOL success = [VIMDeeplink showUpload];`

## Open the current user's profile

#### Swift
`let success = VIMDeeplink.showMyProfile()`

#### Objective C
`BOOL success = [VIMDeeplink showMyProfile];`




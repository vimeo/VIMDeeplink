Open With Vimeo
==================
A helper class to deeplink into the official [Vimeo iOS App](https://itunes.apple.com/us/app/vimeo/id425194759?mt=8).

# Contents
 - [Installation](#installation)
 - [Background](#background)
 - [Reference](#reference)
  - [View Vimeo iOS in the App Store](#view-vimeo-ios-in-the-app-store)
  - [Check if the Vimeo iOS app is installed](#check-if-the-vimeo-ios-app-is-installed)
  - [Open the Vimeo iOS app](#open-the-vimeo-ios-app)
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
2. Drop the VimeoDeeplink.swift file into your project.

# Background
In order for deeplinks to work, the user must have the Vimeo iOS app installed on their device. We expose a [method](#check-if-the-vimeo-app-is-installed) to verify this. If the app is not installed, you can send your users to the [app store](#open-app-in-the-app-store). If the app is installed, you can deeplink til your :heart:'s content. 

Deeplinking to a specific piece of Vimeo content (e.g. a channel, category, user, or video object, etc.) requires that you have the object's `uri`. The `uri` is the unique identifier provided by the Vimeo API. You can obtain object `uri`s by making requests to the Vimeo API or by constructing them by hand (although this is not advised). You can learn more at the [developer site](https://developer.vimeo.com/api). The [VimeoNetworking](https://github.com/vimeo/VimeoNetworking) library for iOS facilitates authentication and communication with the Vimeo API.

Once you have an object's `uri`, you can pass it to `VimeoDeeplink` and start linking.

# Reference

The Vimeo deeplink base URL is: `vimeo://app.vimeo.com`

## View Vimeo iOS in the App Store

    let success = VimeoDeeplinkOpener.viewVimeoAppInAppStore()

## View Vimeo iOS in the App Store

#### Swift
`let success = VimeoDeeplink`

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

## Found an Issue?

Please file it in the git [issue tracker](https://github.com/vimeo/VIMDeeplink/issues).

## Want to Contribute?

If you'd like to contribute, please follow our guidelines found in [CONTRIBUTING.md](CONTRIBUTING.md).

## License

`VIMDeeplink` is available under the MIT license. See the [LICENSE](LICENSE.md) file for more info.

## Questions?

Tweet at us here: [@vimeoapi](https://twitter.com/vimeoapi).

Post on [Stackoverflow](http://stackoverflow.com/questions/tagged/vimeo-ios) with the tag `vimeo-ios`.

Get in touch [here](https://vimeo.com/help/contact).

Interested in working at Vimeo? We're [hiring](https://vimeo.com/jobs)!

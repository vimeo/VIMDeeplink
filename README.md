Open With Vimeo
==================
A helper class to deeplink into the official [Vimeo iOS App](https://itunes.apple.com/us/app/vimeo/id425194759?mt=8).

# Contents
 - [Installation](#installation)
 - [Background](#background)
 - [Examples](#examples)
  - [View Vimeo iOS in the App Store](#view-vimeo-ios-in-the-app-store)
  - [Check if the Vimeo iOS app is installed](#check-if-the-vimeo-ios-app-is-installed)
  - [Open the Vimeo iOS app](#open-the-vimeo-ios-app)
  - [Open all categories](#open-all-categories)
  - [Open the video player](#open-the-video-player)
  - [Open a user profile](#open-a-user-profile)
 
# Installation
1. [Download this repo](https://github.com/vimeo/VIMDeeplink/archive/master.zip).
2. Drop the VimeoDeeplink.swift file into your project.

# Background
In order for deeplinks to work, the user must have the Vimeo iOS app installed on their device. We expose a [method](#check-if-the-vimeo-app-is-installed) to verify this. If the app is not installed, you can send your users to the [app store](#open-app-in-the-app-store). If the app is installed, you can deeplink til your :heart:'s content. 

Deeplinking to a specific piece of Vimeo content (e.g. a channel, category, user, or video object, etc.) requires that you have the object's `uri`. The `uri` is the unique identifier provided by the Vimeo API. You can obtain object `uri`s by making requests to the Vimeo API or by constructing them by hand (although this is not advised). You can learn more at the [developer site](https://developer.vimeo.com/api). The [VimeoNetworking](https://github.com/vimeo/VimeoNetworking) library for iOS facilitates authentication and communication with the Vimeo API.

Once you have an object's `uri`, you can pass it to `VimeoDeeplink` and start linking.

# Examples

The Vimeo deeplink base URL is: `vimeo://app.vimeo.com`

### View Vimeo iOS in the App Store

```Swift
let success = VimeoDeeplinkOpener.viewVimeoAppInAppStore()
```

### Check if the Vimeo iOS app is installed

    let isInstalled = VimeoDeeplinkOpener.isVimeoAppInstalled()

### Open the Vimeo iOS app

    let success = VimeoDeeplinkOpener.openVimeo()

### Open all categories

    let success = VimeoDeeplinkOpener.openCategories()

### Open the video player

    let uri = "/videos/2" // Where `uri` is obtained from the Vimeo API
    let success = VimeoDeeplinkOpener.openVideoPlayer(uri: uri)

### Open a user profile

    let uri = "/users/user123" // Where `uri` is obtained from the Vimeo API
    let success = VimeoDeeplinkOpener.openUserProfile(uri: uri)

For an enhaustive list of this library's functionality see the inline documentation and public API of the [VimeoDeeplink class](VimeoDeeplink/VimeoDeeplink/VimeoDeeplink.swift).

## Found an Issue?

Please file it in the git [issue tracker](https://github.com/vimeo/VIMDeeplink/issues).

## Want to Contribute?

If you'd like to contribute, please follow our guidelines found in [CONTRIBUTING.md](CONTRIBUTING.md).

## License

`VIMDeeplink` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Questions?

Tweet at us here: [@vimeoapi](https://twitter.com/vimeoapi).

Post on [Stackoverflow](http://stackoverflow.com/questions/tagged/vimeo-ios) with the tag `vimeo-ios`.

Get in touch [here](https://vimeo.com/help/contact).

Interested in working at Vimeo? We're [hiring](https://vimeo.com/jobs)!

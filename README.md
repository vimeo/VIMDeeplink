VimeoAppClient-iOS
==================

Simple Objc and Swift wrappers around the Vimeo iOS deeplink API

In Swift:

```
let success = VimeoAppClient.viewVimeoAppInAppStore()

let success = VimeoAppClient.isVimeoAppInstalled()

let success = VimeoAppClient.openVimeoApp()

let videoURI = "..." // Obtained via the Vimeo API
let success = VimeoAppClient.showVideo(videoURI: videoURI)

let userURI = "..." // Obtained via the Vimeo API
let success = VimeoAppClient.showUser(userURI: userURI)
```

In Objc:

```
BOOL success = [VimeoAppClient viewVimeoAppInAppStore];

BOOL success = [VimeoAppClient isVimeoAppInstalled];

BOOL success = [VimeoAppClient openVimeoApp];

NSString *videoURI = @"..."; // Obtained via the Vimeo API
BOOL success = [VimeoAppClient showVideoWithURI:videoURI];

NSString *userURI = @"..."; // Obtained via the Vimeo API
BOOL success = [VimeoAppClient showUserWithURI:userURI];
```

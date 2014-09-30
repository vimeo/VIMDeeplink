VimeoAppClient-iOS
==================

Simple Objc and Swift wrappers around the Vimeo iOS deeplink API

In Swift:

```
let success = VimeoAppClient.viewVimeoAppInAppStore()

let success = VimeoAppClient.isVimeoAppInstalled()

let success = VimeoAppClient.openVimeoApp()

let success = VimeoAppClient.showVideo(videoURI: videoURI) // URI obtained via the Vimeo API

let success = VimeoAppClient.showUser(userURI: "...") // URI obtained via the Vimeo API
```

In Objc:

```
BOOL success = [VimeoAppClient viewVimeoAppInAppStore];

BOOL success = [VimeoAppClient isVimeoAppInstalled];

BOOL success = [VimeoAppClient openVimeoApp];

BOOL success = [VimeoAppClient showVideoWithURI:@"..."]; // URI obtained via the Vimeo API

BOOL success = [VimeoAppClient showUserWithURI:@"..."]; // URI obtained via the Vimeo API
```

//
//  VimeoDeeplink.swift
//  Vimeo
//
//  Created by Alfred Hanssen on 9/10/14.
//  Copyright (c) 2014 Vimeo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import UIKit

// MARK: Deeplink Catalog

/// An enum that describes all deeplinks supported by the Vimeo iOS app.
public enum VimeoDeeplink
{
    /// Open the app. Navigate no further.
    case App

    /// Open the app and display the all categories view.
    case Categories

    /// Open the app and display the view for a single category.
    case Category(uri: String)

    /// Open the app and display the view for a single channel.
    case Channel(uri: String)

    /// Open the app and display the feed view.
    case Feed

    /// Open the app and display the explore view.
    case Explore

    /// Open the app and display the library view.
    case Library

    /// Open the app and display the authenticated user's profile view.
    case Me

    /// Open the app and display the upload view.
    case Upload

    /// Open the app and display the offline playlist.
    case Offline

    /// Open the app and display the purchases playlist.
    case Purchases

    /// Open the app and display the authenticated user's watch later view.
    case WatchLater

    /// Open the app and display the general search view.
    case Search

    /// Open the app and display the search videos view.
    case SearchVideos

    /// Open the app and display the search channels view.
    case SearchChannels

    /// Open the app and display the search people view.
    case SearchPeople

    /// Open the app and display the video (player) view for the video with the specified uri.
    case Video(uri: String)

    /// Open the app and display the video (player) view for the video with the specified uri. Specifically navigate to the Up Next tab.
    case VideoUpNext(uri: String)

    /// Open the app and display the video (player) view for the video with the specified uri. Specifically navigate to the Comments tab.
    case VideoComments(uri: String)

    /// Open the app and display the video (player) view for the video with the specified uri. Specifically navigate to the Likes tab.
    case VideoLikes(uri: String)

    /// Open the app and display the user profile view for the user with the specified uri.
    case User(uri: String)

    /// Open the app and display the user profile view for the user with the specified uri. Specifically navigate to the Followers tab.
    case UserFollowers(uri: String)

    /// Open the app and display the user profile view for the user with the specified uri. Specifically navigate to the Following tab.
    case UserFollowing(uri: String)

    /// Open the app and display the user profile view for the user with the specified uri. Specifically navigate to the Likes tab.
    case UserLikes(uri: String)
}

public extension VimeoDeeplink
{
    /// The scheme used for Vimeo deeplinks.
    public static let Scheme = "vimeo"
    
    /// The host used for Vimeo deeplinks.
    public static let Host = "app.vimeo.com"
    
    /// The base url for Vimeo deeplinks.
    public static var BaseUrl: NSURL
    {
        let components = NSURLComponents()
        components.scheme = self.Scheme
        components.host = self.Host
        
        return components.URL!
    }

    /// The deeplink NSURL representation of the enum case receiver.
    public var URL: NSURL
    {
        switch self
        {
        case App:
            return self.dynamicType.BaseUrl

        case Categories:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("categories")

        case Category(uri: let uri):
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent(uri)
            
        case Channel(uri: let uri):
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent(uri)

        case Feed:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("feed")

        case Explore:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("explore")

        case Library:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("library")
    
        case Me:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("me")
            
        case Upload:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("upload")
            
        case Offline:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("offline")
            
        case Purchases:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("purchases")
            
        case WatchLater:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("watchlater")
            
        case Search:
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent("search")
            
        case SearchVideos:
            return self.dynamicType.deeplinkURLWithPathComponents("search", "videos")
            
        case SearchChannels:
            return self.dynamicType.deeplinkURLWithPathComponents("search", "channels")
            
        case SearchPeople:
            return self.dynamicType.deeplinkURLWithPathComponents("search", "people")
            
        case Video(uri: let uri):
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent(uri)
            
        case VideoUpNext(uri: let uri):
            return self.dynamicType.deeplinkURLWithPathComponents(uri, "upnext")
            
        case VideoComments(uri: let uri):
            return self.dynamicType.deeplinkURLWithPathComponents(uri, "comments")
            
        case VideoLikes(uri: let uri):
            return self.dynamicType.deeplinkURLWithPathComponents(uri, "likes")
            
        case User(uri: let uri):
            return self.dynamicType.BaseUrl.URLByAppendingPathComponent(uri)
            
        case UserFollowers(uri: let uri):
            return self.dynamicType.deeplinkURLWithPathComponents(uri, "followers")
            
        case UserFollowing(uri: let uri):
            return self.dynamicType.deeplinkURLWithPathComponents(uri, "following")
            
        case UserLikes(uri: let uri):
            return self.dynamicType.deeplinkURLWithPathComponents(uri, "likes")
        }
    }
    
    /**
     Accepts a variable number of ordered path components and uses them to create a deeplink URL.
 
     - parameter components: A variable number of ordered path components that will be appended to the deeplink base URL. 
     
     - returns: A deeplink URL with a path composed of `components`.
     */
    private static func deeplinkURLWithPathComponents(components: String ...) -> NSURL
    {
        var url = self.BaseUrl
        
        for component in components
        {
            url = url.URLByAppendingPathComponent(component)
        }
        
        return url
    }
}

// MARK: Deeplink Opener

public class VimeoDeeplinkOpener
{
    /**
     Checks whether the Vimeo iOS app is installed.
     
     - returns: A boolean indicating whether the Vimeo iOS app is installed.
     */
    public static func isVimeoAppInstalled() -> Bool
    {
        let deeplink = VimeoDeeplink.App
        let url = deeplink.URL
        
        return UIApplication.sharedApplication().canOpenURL(url)
    }

    /**
     Attempts to open the Vimeo iOS app via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openVimeo() -> Bool
    {
        return self.openDeeplink(.App)
    }

    /**
     Attempts to open the Vimeo iOS app "all categories view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openCategories() -> Bool
    {
        return self.openDeeplink(.Categories)
    }

    /**
     Attempts to open the Vimeo iOS app "individual category view" for the category with `uri` via a deeplink.
     
     - parameter uri: The category `uri` obtained from the Vimeo API.

     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openCategory(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.Category(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "individual channel view" for the channel with `uri` via a deeplink.
     
     - parameter uri: The channel `uri` obtained from the Vimeo API.

     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openChannel(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.Channel(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "feed view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openFeed() -> Bool
    {
        return self.openDeeplink(.Feed)
    }

    /**
     Attempts to open the Vimeo iOS app "explore view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openExplore() -> Bool
    {
        return self.openDeeplink(.Explore)
    }

    /**
     Attempts to open the Vimeo iOS app "library view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openLibrary() -> Bool
    {
        return self.openDeeplink(.Library)
    }

    /**
     Attempts to open the Vimeo iOS app "me view" (user profile of the logged in user) via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openMe() -> Bool
    {
        return self.openDeeplink(.Me)
    }

    /**
     Attempts to open the Vimeo iOS app "upload view" (camera roll) via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openUpload() -> Bool
    {
        return self.openDeeplink(.Upload)
    }
    
    /**
     Attempts to open the Vimeo iOS app "offline library view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openOffline() -> Bool
    {
        return self.openDeeplink(.Offline)
    }
    
    /**
     Attempts to open the Vimeo iOS app "purchases library view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openPurchases() -> Bool
    {
        return self.openDeeplink(.Purchases)
    }

    /**
     Attempts to open the Vimeo iOS app "watch later library view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openWatchLater() -> Bool
    {
        return self.openDeeplink(.WatchLater)
    }
    
    /**
     Attempts to open the Vimeo iOS app "search view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openSearch() -> Bool
    {
        return self.openDeeplink(.Search)
    }

    /**
     Attempts to open the Vimeo iOS app "search videos view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openSearchVideos() -> Bool
    {
        return self.openDeeplink(.SearchVideos)
    }

    /**
     Attempts to open the Vimeo iOS app "search channels view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openSearchChannels() -> Bool
    {
        return self.openDeeplink(.SearchChannels)
    }

    /**
     Attempts to open the Vimeo iOS app "search people view" via a deeplink.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openSearchPeople() -> Bool
    {
        return self.openDeeplink(.SearchPeople)
    }

    /**
     Attempts to open the Vimeo iOS app "video player view" via a deeplink for the video with `uri` via a deeplink.
     
     - parameter uri: The video `uri` obtained from the Vimeo API.

     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openVideoPlayer(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.Video(uri: uri)

        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "video player view" and "up next tab" for the video with `uri` via a deeplink.
     
     - parameter uri: The video `uri` obtained from the Vimeo API.

     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openVideoPlayerUpNextTab(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.VideoUpNext(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "video player view" and "comments tab" for the video with `uri` via a deeplink.

     - parameter uri: The video `uri` obtained from the Vimeo API.

     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openVideoPlayerCommentsTab(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.VideoComments(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "video player view" and "likes tab" for the video with `uri` via a deeplink.
     
     - parameter uri: The video `uri` obtained from the Vimeo API.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openVideoPlayerLikesTab(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.VideoLikes(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "user profile view" for the user with `uri` via a deeplink. 
     
     - parameter uri: The user `uri` obtained from the Vimeo API.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openUserProfile(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.User(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "user profile view" and "followers tab" for the user with `uri` via a deeplink.
     
     - parameter uri: The user `uri` obtained from the Vimeo API.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openUserFollowers(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.UserFollowers(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "user profile view" and "following tab" for the user with `uri` via a deeplink. 
     
     - parameter uri: The user `uri` obtained from the Vimeo API.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openUserFollowing(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.UserFollowing(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app "user profile view" and "likes tab" for the user with `uri` via a deeplink.
     
     - parameter uri: The user `uri` obtained from the Vimeo API.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openUserLikes(uri uri: String) -> Bool
    {
        let deeplink = VimeoDeeplink.UserLikes(uri: uri)
        
        return self.openDeeplink(deeplink)
    }

    /**
     Attempts to open the Vimeo iOS app using the specified deeplink. First checks to see if the Vimeo iOS app is installed.
     
     - returns: A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
     */
    public static func openDeeplink(deeplink: VimeoDeeplink) -> Bool
    {
        guard self.isVimeoAppInstalled() else
        {
            return false
        }
        
        let url = deeplink.URL
        
        return UIApplication.sharedApplication().openURL(url)
    }
}

// MARK: App Store Opener

public extension VimeoDeeplinkOpener
{
    /// The scheme used for App Store URLs.
    private static let AppStoreScheme = "itms-apps"
    
    /// The host used for App Store URLs.
    private static let AppStoreHost = "itunes.apple.com"
    
    /// The path of the App Store URL for the Vimeo iOS app.
    private static let AppStorePath = "/us/app/id425194759"
    
    /// The App Store URL to the Vimeo iOS app.
    public static var AppStoreUrl: NSURL
    {
        let components = NSURLComponents()
        components.scheme = self.AppStoreScheme
        components.host = self.AppStoreHost
        components.path = self.AppStorePath
        
        return components.URL!
    }
    
    /**
     Attempts to open the App Store URL for the Vimeo iOS app.
     
     - returns: A boolean indicating whether the URL could be opened.
     */
    public static func viewVimeoAppInAppStore() -> Bool
    {
        let url = self.AppStoreUrl
        
        return UIApplication.sharedApplication().openURL(url)
    }
}

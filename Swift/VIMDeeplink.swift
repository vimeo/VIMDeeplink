//
//  VIMDeeplink.swift
//  Vimeo
//
//  Created by Alfred Hanssen on 9/10/14.
//  Copyright (c) 2014 Vimeo. All rights reserved.
//

import Foundation
import UIKit

private let BaseURLString = "vimeo://app.vimeo.com"
private let AppStoreURLString = "itms-apps://itunes.apple.com/us/app/id425194759"

private let uploadLink = "/upload"
private let profileLink = "/me"
private let categoryLink = "/categories"
private let exploreLink = "/explore"
private let feedLink = "/feed"
private let playlistsLink = "/playlists"

private enum VimeoApp
{
    case Video(String)
    case User(String)
    case AllCategories
    case Category(String)
    case Channel(String)
    case Explore
    case Feed
    case Me
    case Playlists
    case Upload
    
}

private protocol URL
{
    var URL : NSURL { get }
}

extension VimeoApp : URL
{
    var URL: NSURL
    {
        switch self
        {
        case .Video(let videoURI): return NSURL(string: BaseURLString + videoURI)!
        case .User(let userURI): return NSURL(string: BaseURLString + userURI)!
        case .AllCategories: return NSURL(string: BaseURLString + categoryLink)!
        case .Category(let categoryURI): return NSURL(string: BaseURLString + categoryURI)!
        case .Channel(let channelURI): return NSURL(string: BaseURLString + channelURI)!
        case .Explore: return NSURL(string: BaseURLString + exploreLink)!
        case .Feed: return NSURL(string: BaseURLString + feedLink)!
        case .Me: return NSURL(string: BaseURLString + profileLink)!
        case .Playlists: return NSURL(string: BaseURLString + playlistsLink)!
        case .Upload: return NSURL(string: BaseURLString + uploadLink)!
        }
    }
}

public class VIMDeeplink
{
    public class func viewVimeoAppInAppStore() -> Bool
    {
        if let URL = NSURL(string: AppStoreURLString)
        {
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }

    public class func isVimeoAppInstalled() -> Bool
    {
        if let URL = NSURL(string: BaseURLString)
        {
            return UIApplication.sharedApplication().canOpenURL(URL)
        }

        return false
    }

    public class func openVimeoApp() -> Bool
    {
        if let URL = NSURL(string: BaseURLString)
        {
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showVideo(videoURI: String!) -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Video(videoURI)
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }

    public class func showUser(userURI: String!) -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.User(userURI)
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showCategory(categoryURI: String!) -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Category(categoryURI)
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showChannel(channelURI: String!) -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Channel(channelURI)
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showAllCategories() -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.AllCategories
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showExplore() -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Explore
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showFeed() -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Feed
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showMyProfile() -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Me
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showPlaylists() -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Playlists
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
    
    public class func showUpload() -> Bool
    {
        if (isVimeoAppInstalled())
        {
            let endpoint = VimeoApp.Upload
            let URL = endpoint.URL
            
            return UIApplication.sharedApplication().openURL(URL)
        }
        
        return false
    }
}

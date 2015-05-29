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
private let AppStoreURLString = "itms-apps://itunes.apple.com/us/app/425194759"

private let uploadLink = "/upload"
private let profileLink = "/me"

private enum VimeoApp
{
    case Video(String)
    case User(String)
    case Upload
    case Me
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
            case .Upload: return NSURL(string: BaseURLString + uploadLink)!
            case .Me: return NSURL(string: BaseURLString + profileLink)!
        }
    }
}

public class VimeoAppClient
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
}

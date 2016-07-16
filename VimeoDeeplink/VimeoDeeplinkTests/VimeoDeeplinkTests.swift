//
//  VimeoDeeplinkTests.swift
//  VimeoDeeplinkTests
//
//  Created by Alfred Hanssen on 7/15/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import XCTest
@testable import VimeoDeeplink

class VimeoDeeplinkTests: XCTestCase
{
    // Storing this in a constant instead of using VimeoDeeplink.BaseUrl because the latter is variable. [AH] 7/15/2016
    private let baseURLString = "vimeo://app.vimeo.com"
    private let uri = "test"
    
    func testBaseURL()
    {
        XCTAssert(VimeoDeeplink.BaseUrl.absoluteString == self.baseURLString, "Base URL is expected to be \(self.baseURLString)")
    }

    func testAppStoreURL()
    {
        let string = "itms-apps://itunes.apple.com/us/app/id425194759"
        
        XCTAssert(VimeoDeeplinkOpener.AppStoreUrl.absoluteString == string, "Base URL is expected to be \(string)")
    }
    
    func testDeeplinkApp()
    {
        let deeplink = VimeoDeeplink.App
        
        XCTAssert(deeplink.URL.absoluteString == self.baseURLString, "Deeplink is expected to be \(self.baseURLString)")
    }

    func testDeeplinkCategories()
    {
        let deeplink = VimeoDeeplink.Categories
        let string = "\(self.baseURLString)/categories"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkCategory()
    {
        let deeplink = VimeoDeeplink.Category(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkChannel()
    {
        let deeplink = VimeoDeeplink.Channel(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkFeed()
    {
        let deeplink = VimeoDeeplink.Feed
        let string = "\(self.baseURLString)/feed"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkExplore()
    {
        let deeplink = VimeoDeeplink.Explore
        let string = "\(self.baseURLString)/explore"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkLibrary()
    {
        let deeplink = VimeoDeeplink.Library
        let string = "\(self.baseURLString)/library"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkMe()
    {
        let deeplink = VimeoDeeplink.Me
        let string = "\(self.baseURLString)/me"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkUpload()
    {
        let deeplink = VimeoDeeplink.Upload
        let string = "\(self.baseURLString)/upload"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkOfflineLibrary()
    {
        let deeplink = VimeoDeeplink.Offline
        let string = "\(self.baseURLString)/offline"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkPurchasesLibrary()
    {
        let deeplink = VimeoDeeplink.Purchases
        let string = "\(self.baseURLString)/purchases"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkWatchLaterLibrary()
    {
        let deeplink = VimeoDeeplink.WatchLater
        let string = "\(self.baseURLString)/watchlater"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkSearch()
    {
        let deeplink = VimeoDeeplink.Search
        let string = "\(self.baseURLString)/search"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkSearchPeople()
    {
        let deeplink = VimeoDeeplink.SearchPeople
        let string = "\(self.baseURLString)/search/people"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkSearchChannels()
    {
        let deeplink = VimeoDeeplink.SearchChannels
        let string = "\(self.baseURLString)/search/channels"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkSearchVideos()
    {
        let deeplink = VimeoDeeplink.SearchVideos
        let string = "\(self.baseURLString)/search/videos"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkVideo()
    {
        let deeplink = VimeoDeeplink.Video(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkVideoUpNext()
    {
        let deeplink = VimeoDeeplink.VideoUpNext(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)/upnext"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkVideoComments()
    {
        let deeplink = VimeoDeeplink.VideoComments(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)/comments"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkVideoLikes()
    {
        let deeplink = VimeoDeeplink.VideoLikes(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)/likes"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkUser()
    {
        let deeplink = VimeoDeeplink.User(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkUserFollowers()
    {
        let deeplink = VimeoDeeplink.UserFollowers(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)/followers"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkUserFollowing()
    {
        let deeplink = VimeoDeeplink.UserFollowing(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)/following"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }

    func testDeeplinkUserLikes()
    {
        let deeplink = VimeoDeeplink.UserLikes(uri: self.uri)
        let string = "\(self.baseURLString)/\(self.uri)/likes"
        
        XCTAssert(deeplink.URL.absoluteString == string, "Deeplink is expected to be \(string)")
    }
}

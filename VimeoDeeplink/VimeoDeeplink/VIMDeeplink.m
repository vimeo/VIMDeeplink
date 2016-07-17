//
//  VIMDeeplink.m
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

#import "VIMDeeplink.h"

@import UIKit;

/// The base url for Vimeo deeplinks.
NSString *VimeoBaseURLString = @"vimeo://app.vimeo.com";

/// The App Store URL to the Vimeo iOS app.
NSString *VimeoAppStoreURLString = @"itms-apps://itunes.apple.com/us/app/id425194759";

static NSString *CategoriesPathComponent = @"categories";
static NSString *FeedPathComponent = @"feed";
static NSString *ExplorePathComponent = @"explore";
static NSString *LibraryPathComponent = @"library";
static NSString *MePathComponent = @"me";
static NSString *UploadPathComponent = @"upload";
static NSString *OfflinePathComponent = @"offline";
static NSString *PurchasesPathComponent = @"purchases";
static NSString *WatchLaterPathComponent = @"watchlater";
static NSString *SearchPathComponent = @"search";
static NSString *VideosPathComponent = @"videos";
static NSString *ChannelsPathComponent = @"channels";
static NSString *PeoplePathComponent = @"people";
static NSString *UpNextPathComponent = @"upnext";
static NSString *CommentsPathComponent = @"comments";
static NSString *LikesPathComponent = @"likes";
static NSString *FollowersPathComponent = @"followers";
static NSString *FollowingPathComponent = @"following";

@implementation VIMDeeplink

#pragma mark - Public API

/*!
 @brief Attempts to open the App Store URL for the Vimeo iOS app.
 
 @return BOOL A boolean indicating whether the URL could be opened.
 */
+ (BOOL)viewVimeoAppInAppStore
{
    NSURL *URL = [NSURL URLWithString:VimeoAppStoreURLString];
    
    return [[UIApplication sharedApplication] openURL:URL];
}

/*!
 @brief Checks whether the Vimeo iOS app is installed.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app is installed.
 */
+ (BOOL)isVimeoAppInstalled
{
    NSURL *URL = [NSURL URLWithString:VimeoBaseURLString];
    
    return [[UIApplication sharedApplication] canOpenURL:URL];
}

/*!
 @brief Attempts to open the Vimeo iOS app via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVimeo
{
    NSURL *URL = [NSURL URLWithString:VimeoBaseURLString];
    
    return [[UIApplication sharedApplication] openURL:URL];
}

/*!
 @brief Attempts to open the Vimeo iOS app "all categories view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openCategories
{
    return [self openDeeplinkWithPathComponents:CategoriesPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "individual category view" for the category with `uri` via a deeplink.
 
 @param uri The category `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openCategory:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

/*!
 @brief Attempts to open the Vimeo iOS app "individual channel view" for the channel with `uri` via a deeplink.
 
 @param uri The channel `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openChannel:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

/*!
 @brief Attempts to open the Vimeo iOS app "feed view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openFeed
{
    return [self openDeeplinkWithPathComponents:FeedPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "explore view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openExplore
{
    return [self openDeeplinkWithPathComponents:ExplorePathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openLibrary
{
    return [self openDeeplinkWithPathComponents:LibraryPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "me view" (user profile of the logged in user) via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openMe
{
    return [self openDeeplinkWithPathComponents:MePathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "upload view" (camera roll) via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUpload
{
    return [self openDeeplinkWithPathComponents:UploadPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "offline library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openOffline
{
    return [self openDeeplinkWithPathComponents:OfflinePathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "purchases library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openPurchases
{
    return [self openDeeplinkWithPathComponents:PurchasesPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "watch later library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openWatchLater
{
    return [self openDeeplinkWithPathComponents:WatchLaterPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "search view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearch
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "search videos view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearchVideos
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent, VideosPathComponent, nil];
}

/*!
 @brief Attempts to open the Vimeo iOS app "search channels view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearchChannels
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent, ChannelsPathComponent, nil];
}

/*!
 @brief Attempts to open the Vimeo iOS app "search people view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearchPeople
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent, PeoplePathComponent, nil];
}

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" via a deeplink for the video with `uri` via a deeplink.
 
 @param uri The video `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayer:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" and "up next tab" for the video with `uri` via a deeplink.
 
 @param uri The video `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayerUpNextTab:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, UpNextPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" and "comments tab" for the video with `uri` via a deeplink. 
 
 @param uri The video `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayerCommentsTab:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, CommentsPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" and "likes tab" for the video with `uri` via a deeplink.
 
 @param uri The video `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayerLikesTab:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, LikesPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" for the user with `uri` via a deeplink. 
 
 @param uri The user `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserProfile:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" and "followers tab" for the user with `uri` via a deeplink.
 
 @param uri The user `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserFollowers:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, FollowersPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" and "following tab" for the user with `uri` via a deeplink.
 
 @param uri The user `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserFollowing:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, FollowingPathComponent];
}

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" and "likes tab" for the user with `uri` via a deeplink.
 
 @param uri The user `uri` obtained from the Vimeo API.

 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserLikes:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, LikesPathComponent];
}

#pragma mark - Private API

/*!
 @brief Constructs a Vimeo iOS deeplink URL and attempts to open the URL.
 
 @param pathComponent A variadic list of path components.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openDeeplinkWithPathComponents:(NSString * _Nonnull)pathComponent, ...
{
    NSAssert([NSThread isMainThread], @"Attempt to open a deeplink from a thread other than the main thread.");
    
    if ([VIMDeeplink isVimeoAppInstalled] == false)
    {
        return false;
    }

    NSURL *URL = [self deeplinkWithPathComponents:pathComponent];
    
    return [[UIApplication sharedApplication] openURL:URL];
}

+ (NSURL *_Nullable)deeplinkWithPathComponents:(NSString * _Nonnull)pathComponent, ...
{
    NSParameterAssert(pathComponent);
    
    if ([pathComponent length] == 0)
    {
        return nil;
    }
    
    NSURL *url = [NSURL URLWithString:VimeoBaseURLString];
    url = [url URLByAppendingPathComponent:pathComponent];
    
    id eachComponent;
    va_list argumentList;
    va_start(argumentList, pathComponent);
    while ((eachComponent = va_arg(argumentList, NSString *)))
    {
        if ([eachComponent length] == 0)
        {
            continue;
        }

        url = [url URLByAppendingPathComponent:eachComponent];
    }
    va_end(argumentList);
    
    return url;
}

@end

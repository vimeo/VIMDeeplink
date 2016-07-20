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

NSString *VimeoBaseURLString = @"vimeo://app.vimeo.com";

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

+ (BOOL)viewVimeoAppInAppStore
{
    NSURL *URL = [NSURL URLWithString:VimeoAppStoreURLString];
    
    return [[UIApplication sharedApplication] openURL:URL];
}

+ (BOOL)isVimeoAppInstalled
{
    NSURL *URL = [NSURL URLWithString:VimeoBaseURLString];
    
    return [[UIApplication sharedApplication] canOpenURL:URL];
}

+ (BOOL)openVimeo
{
    NSURL *URL = [NSURL URLWithString:VimeoBaseURLString];
    
    return [[UIApplication sharedApplication] openURL:URL];
}

+ (BOOL)openCategories
{
    return [self openDeeplinkWithPathComponents:CategoriesPathComponent];
}

+ (BOOL)openCategory:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

+ (BOOL)openChannel:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

+ (BOOL)openFeed
{
    return [self openDeeplinkWithPathComponents:FeedPathComponent];
}

+ (BOOL)openExplore
{
    return [self openDeeplinkWithPathComponents:ExplorePathComponent];
}

+ (BOOL)openLibrary
{
    return [self openDeeplinkWithPathComponents:LibraryPathComponent];
}

+ (BOOL)openMe
{
    return [self openDeeplinkWithPathComponents:MePathComponent];
}

+ (BOOL)openUpload
{
    return [self openDeeplinkWithPathComponents:UploadPathComponent];
}

+ (BOOL)openOffline
{
    return [self openDeeplinkWithPathComponents:OfflinePathComponent];
}

+ (BOOL)openPurchases
{
    return [self openDeeplinkWithPathComponents:PurchasesPathComponent];
}

+ (BOOL)openWatchLater
{
    return [self openDeeplinkWithPathComponents:WatchLaterPathComponent];
}

+ (BOOL)openOnDemandContainer:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

+ (BOOL)openSearch
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent];
}

+ (BOOL)openSearchVideos
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent, VideosPathComponent, nil];
}

+ (BOOL)openSearchChannels
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent, ChannelsPathComponent, nil];
}

+ (BOOL)openSearchPeople
{
    return [self openDeeplinkWithPathComponents:SearchPathComponent, PeoplePathComponent, nil];
}

+ (BOOL)openVideoPlayer:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

+ (BOOL)openVideoPlayerUpNextTab:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, UpNextPathComponent];
}

+ (BOOL)openVideoPlayerCommentsTab:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, CommentsPathComponent];
}

+ (BOOL)openVideoPlayerLikesTab:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, LikesPathComponent];
}

+ (BOOL)openUserProfile:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri];
}

+ (BOOL)openUserFollowers:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, FollowersPathComponent];
}

+ (BOOL)openUserFollowing:(NSString * _Nonnull)uri
{
    return [self openDeeplinkWithPathComponents:uri, FollowingPathComponent];
}

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
    
    if ([VIMDeeplink isVimeoAppInstalled] == NO)
    {
        return NO;
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

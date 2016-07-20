//
//  VIMDeeplink.h
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

@import Foundation;

/// The base url for Vimeo deeplinks.
extern NSString * _Nonnull VimeoBaseURLString;

/// The App Store URL to the Vimeo iOS app.
extern NSString * _Nonnull VimeoAppStoreURLString;

@interface VIMDeeplink: NSObject

/*!
 @brief Attempts to open the App Store URL for the Vimeo iOS app.
 
 @return BOOL A boolean indicating whether the URL could be opened.
 */
+ (BOOL)viewVimeoAppInAppStore;

/*!
 @brief Checks whether the Vimeo iOS app is installed.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app is installed.
 */
+ (BOOL)isVimeoAppInstalled;

/*!
 @brief Attempts to open the Vimeo iOS app via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVimeo;

/*!
 @brief Attempts to open the Vimeo iOS app "all categories view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openCategories;

/*!
 @brief Attempts to open the Vimeo iOS app "individual category view" for the category with `uri` via a deeplink.
 
 @param uri The category `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openCategory:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "individual channel view" for the channel with `uri` via a deeplink.
 
 @param uri The channel `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openChannel:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "feed view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openFeed;

/*!
 @brief Attempts to open the Vimeo iOS app "explore view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openExplore;

/*!
 @brief Attempts to open the Vimeo iOS app "library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openLibrary;

/*!
 @brief Attempts to open the Vimeo iOS app "me view" (user profile of the logged in user) via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openMe;

/*!
 @brief Attempts to open the Vimeo iOS app "upload view" (camera roll) via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUpload;

/*!
 @brief Attempts to open the Vimeo iOS app "offline library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openOffline;

/*!
 @brief Attempts to open the Vimeo iOS app "purchases library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openPurchases;

/*!
 @brief Attempts to open the Vimeo iOS app "watch later library view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openWatchLater;

/*!
 @brief Attempts to open the Vimeo iOS app "on demand container view" for the on demand item with `uri` via a deeplink.
 
 @param uri The on demand container `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openOnDemandContainer:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "search view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearch;

/*!
 @brief Attempts to open the Vimeo iOS app "search videos view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearchVideos;

/*!
 @brief Attempts to open the Vimeo iOS app "search channels view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearchChannels;

/*!
 @brief Attempts to open the Vimeo iOS app "search people view" via a deeplink.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openSearchPeople;

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" via a deeplink for the video with `uri` via a deeplink.
 
 @param uri The video `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayer:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" and "up next tab" for the video with `uri` via a deeplink.
 
 @param uri The video `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayerUpNextTab:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" and "comments tab" for the video with `uri` via a deeplink.
 
 @param uri The video `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayerCommentsTab:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "video player view" and "likes tab" for the video with `uri` via a deeplink.
 
 @param uri The video `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openVideoPlayerLikesTab:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" for the user with `uri` via a deeplink.
 
 @param uri The user `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserProfile:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" and "followers tab" for the user with `uri` via a deeplink.
 
 @param uri The user `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserFollowers:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" and "following tab" for the user with `uri` via a deeplink.
 
 @param uri The user `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserFollowing:(NSString * _Nonnull)uri;

/*!
 @brief Attempts to open the Vimeo iOS app "user profile view" and "likes tab" for the user with `uri` via a deeplink.
 
 @param uri The user `uri` obtained from the Vimeo API.
 
 @return BOOL A boolean indicating whether the Vimeo iOS app could be opened with this deeplink.
 */
+ (BOOL)openUserLikes:(NSString * _Nonnull)uri;

@end

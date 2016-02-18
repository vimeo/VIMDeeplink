//
//  VIMDeeplink.m
//  Vimeo
//
//  Created by Alfred Hanssen on 9/10/14.
//  Copyright (c) 2014 Vimeo. All rights reserved.
//

#import "VIMDeeplink.h"

#import <UIKit/UIKit.h>

static NSString *BaseURLString = @"vimeo://app.vimeo.com";
static NSString *AppStoreURLString = @"itms-apps://itunes.apple.com/us/app/id425194759";

static NSString *UploadLink = @"/upload";
static NSString *ProfileLink = @"/me";
static NSString *CategoryLink = @"/categories";
static NSString *ExploreLink = @"/explore";
static NSString *FeedLink = @"/feed";
static NSString *PlaylistsLink = @"/playlists";

@implementation VIMDeeplink

+ (BOOL)viewVimeoAppInAppStore
{
    NSURL *URL = [NSURL URLWithString:AppStoreURLString];
    
    return [[UIApplication sharedApplication] openURL:URL];
}

+ (BOOL)isVimeoAppInstalled
{
    NSURL *URL = [NSURL URLWithString:BaseURLString];
    
    return [[UIApplication sharedApplication] canOpenURL:URL];
}

+ (BOOL)openVimeoApp
{
    NSURL *URL = [NSURL URLWithString:BaseURLString];
    
    return [[UIApplication sharedApplication] openURL:URL];
}

+ (BOOL)showVideoWithURI:(NSString *)videoURI
{
    if (videoURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:videoURI];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showUserWithURI:(NSString *)userURI
{
    if (userURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:userURI];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showCategoryWithURI:(NSString *)categoryURI
{
    if (userURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:categoryURI];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showChannelWithURI:(NSString *)channelURI
{
    if (userURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:channelURI];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showAllCategories
{
    if (userURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:CategoryLink];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showExplore
{
    if (userURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:ExploreLink];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showFeed
{
    if (userURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:FeedLink];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showPlaylists
{
    if (userURI && [VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:PlaylistsLink];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showUpload
{
    if ([VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:UploadLink];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showMyProfile
{
    if ([VIMDeeplink isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:ProfileLink];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

@end

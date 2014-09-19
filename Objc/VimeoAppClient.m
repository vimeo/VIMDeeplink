//
//  VimeoAppClient.m
//  VimeoObjcSDK
//
//  Created by Alfred Hanssen on 9/10/14.
//  Copyright (c) 2014 Vimeo. All rights reserved.
//

#import "VimeoAppClient.h"

#import <UIKit/UIKit.h>

static NSString *BaseURLString = @"vimeo://app.vimeo.com";
static NSString *AppStoreURLString = @"itms-apps://itunes.apple.com/us/app/425194759";

@implementation VimeoAppClient

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
    if (videoURI && [VimeoAppClient isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:videoURI];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

+ (BOOL)showUserWithURI:(NSString *)userURI
{
    if (userURI && [VimeoAppClient isVimeoAppInstalled])
    {
        NSString *URLString = [BaseURLString stringByAppendingString:userURI];
        NSURL *URL = [NSURL URLWithString:URLString];
        
        return [[UIApplication sharedApplication] openURL:URL];
    }
    
    return NO;
}

@end

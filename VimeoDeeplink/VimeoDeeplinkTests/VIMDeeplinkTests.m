//
//  VIMDeeplinkTests.m
//  VimeoDeeplink
//
//  Created by Alfred Hanssen on 7/17/16.
//  Copyright © 2016 Vimeo. All rights reserved.
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

@import XCTest;

#import "VIMDeeplink.h"

@interface VIMDeeplink (Testing)

// Exposing this here so that we can test it. [AH] 7/17/2016
+ (NSURL *_Nullable)deeplinkWithPathComponents:(NSString * _Nonnull)pathComponent, ...;

@end

@interface VIMDeeplinkTests : XCTestCase

@end

@implementation VIMDeeplinkTests

- (void)testBaseURL
{
    XCTAssert([VimeoBaseURLString isEqualToString:@"vimeo://app.vimeo.com"]);
}

- (void)testAppStoreURL
{
    XCTAssert([VimeoAppStoreURLString isEqualToString:@"itms-apps://itunes.apple.com/us/app/id425194759"]);
}

- (void)testOpenDeeplinkWithPathComponents
{
    NSURL *url = [VIMDeeplink deeplinkWithPathComponents:@"first"];
    XCTAssert([url.absoluteString isEqualToString:@"vimeo://app.vimeo.com/first"]);

    url = [VIMDeeplink deeplinkWithPathComponents:@"first", @"second"];
    XCTAssert([url.absoluteString isEqualToString:@"vimeo://app.vimeo.com/first/second"]);

    url = [VIMDeeplink deeplinkWithPathComponents:@""];
    XCTAssertNil(url);
}

@end

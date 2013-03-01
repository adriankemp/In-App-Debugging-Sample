//
//  AppDelegate.m
//  debug-logging-sample-ios
//
//  Created by Adrian Kemp on 2013-03-01.
//  Copyright (c) 2013 Adrian Kemp. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (ApplicationWindow *)window {
    if(!_window) {
        _window = [[ApplicationWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}

@end

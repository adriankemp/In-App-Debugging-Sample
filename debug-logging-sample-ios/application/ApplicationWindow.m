//
//  ApplicationWindow.m
//  debug-logging-sample-ios
//
//  Created by Adrian Kemp on 2013-03-01.
//  Copyright (c) 2013 Adrian Kemp. All rights reserved.
//

#import "ApplicationWindow.h"
#import <debug-logging-ios/DebugWindow.h>

@interface ApplicationWindow ()

@property (nonatomic, weak) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation ApplicationWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self addGestureRecognizer: self.panGestureRecognizer = (UIPanGestureRecognizer *)[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(recievedPanGesture:)]];
        self.panGestureRecognizer.minimumNumberOfTouches = 2;
    }
    return self;
}

- (void)becomeKeyWindow {
    [super becomeKeyWindow];
    self.panGestureRecognizer.enabled = YES;
}

- (void)recievedPanGesture:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint location = [panGestureRecognizer locationInView:self];
    switch (panGestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            if(location.x > 100.0f) {
                panGestureRecognizer.enabled = NO;
                panGestureRecognizer.enabled = YES;
            }
            break;
        case UIGestureRecognizerStateChanged:
            if (location.x > 150.0f) {
                [[DebugWindow sharedWindow] makeKeyAndVisible];
                [[DebugConsoleViewController defaultController] presentDebugConsole];
                panGestureRecognizer.enabled = NO;
            }
            break;
        case UIGestureRecognizerStateEnded:
            break;
        default:
            break;
    }
}

@end

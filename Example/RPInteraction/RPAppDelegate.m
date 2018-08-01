//
//  RPAppDelegate.m
//  RPInteraction
//
//  Created by nbolatov on 07/01/2018.
//  Copyright (c) 2018 nbolatov. All rights reserved.
//

#import "RPAppDelegate.h"
#import "RPExampleViewController.h"

@implementation RPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _window.rootViewController = [RPExampleViewController new];
    [_window makeKeyAndVisible];
    return YES;
}

@end

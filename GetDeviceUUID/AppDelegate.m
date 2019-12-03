//
//  AppDelegate.m
//  GetDeviceUUID
//
//  Created by Apple on 2019/12/3.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "MDCNUUID.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"当前设备的UUID是：**** %@",[MDCNUUID getUUID]);
    return YES;
}

@end

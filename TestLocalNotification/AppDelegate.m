//
//  AppDelegate.m
//  TestLocalNotification
//
//  Created by dean on 2016/5/16.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    application.applicationIconBadgeNumber = 0;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    //想要收到通知，一定要先加入下面這一段設定
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge
                                                                                                              categories:nil]];
    }
//     [application setApplicationIconBadgeNumber:-1];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    UILocalNotification* notifyAlarm = [[UILocalNotification alloc] init];
    notifyAlarm.applicationIconBadgeNumber = 0;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)addNewSchedult:(NSDate *)date {
    UIApplication* app = [UIApplication sharedApplication];
    UILocalNotification* notifyAlarm = [[UILocalNotification alloc] init];
    if (notifyAlarm) {
        notifyAlarm.fireDate = date;
        notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
        notifyAlarm.repeatInterval = 0;
        notifyAlarm.applicationIconBadgeNumber = ([[[UIApplication sharedApplication] scheduledLocalNotifications] count] + 1);
//        notifyAlarm.applicationIconBadgeNumber++;
//        notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] +1;
        notifyAlarm.soundName = @"";
        notifyAlarm.alertBody = [NSString stringWithFormat: @"Be happy ^_^\n%@", date];
        [app scheduleLocalNotification:notifyAlarm];
    }
}
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UIApplicationState state = [application applicationState];
    
    if (state == UIApplicationStateInactive)
    {
        // Application was in the background when notification
        // was delivered.
        
    }
    notification.applicationIconBadgeNumber = 0;
}


@end

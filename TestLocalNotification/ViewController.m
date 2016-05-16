//
//  ViewController.m
//  TestLocalNotification
//
//  Created by dean on 2016/5/16.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addNotificationBtn:(id)sender {
    
    UIApplication* app = [UIApplication sharedApplication];
    UILocalNotification* notifyAlarm = [[UILocalNotification alloc] init];
    
    notifyAlarm.fireDate = [[NSDate date] dateByAddingTimeInterval:1];
    notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
    notifyAlarm.repeatInterval = 0;
    notifyAlarm.applicationIconBadgeNumber = ([[[UIApplication sharedApplication] scheduledLocalNotifications] count] + 1);
        notifyAlarm.soundName = @"";
    notifyAlarm.alertBody = @"hello world";
    //        [app scheduleLocalNotification:notifyAlarm];
    [[UIApplication sharedApplication] presentLocalNotificationNow:notifyAlarm];

}

@end

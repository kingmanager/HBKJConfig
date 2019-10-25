//
//  UIViewController+HBKJAlert.m
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/23.
//  Copyright © 2019 com.best. All rights reserved.
//

#import "UIViewController+HBKJAlert.h"

@implementation UIViewController (HBKJAlert)

-(void)dismissAlertController:(NSTimer *)timer {
    UIAlertController *alertController=timer.userInfo;
    [alertController dismissViewControllerAnimated:YES completion:nil];
    [timer invalidate];
    timer = nil;
}

#pragma mark ===1
-(void)systemMessage:(NSString *)message{
    [self systemMessage:message Handler:nil];
}

-(void)systemMessage:(NSString *)message Handler:(void (^ __nullable)(UIAlertAction *action))handler{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"提示" message:message
                                                                         preferredStyle:UIAlertControllerStyleAlert];
       
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:handler];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark ===其他
-(void)systemDismissMessage:(NSString *)message TimeInterval:(NSTimeInterval)timerInerval{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *msgStr=[[NSMutableAttributedString alloc] initWithString:message];
    [msgStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:NSMakeRange(0, message.length)];
    [alertController setValue:msgStr forKey:@"attributedMessage"];
    [self presentViewController:alertController animated:NO completion:nil];

    [NSTimer scheduledTimerWithTimeInterval:timerInerval target:self selector:@selector(dismissAlertController:) userInfo:alertController repeats:NO];
}

-(void)systemPopMessage:(NSString *)message{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"系统提醒" message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    [NSThread sleepForTimeInterval:0.5];
}

-(void)systemPopRootMessage:(NSString *)message{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"系统提醒" message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


@end

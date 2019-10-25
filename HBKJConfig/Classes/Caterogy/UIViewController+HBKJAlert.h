//
//  UIViewController+HBKJAlert.h
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/23.
//  Copyright © 2019 com.best. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HBKJAlert)

#pragma mark ===1
-(void)systemMessage:(NSString *)message;

-(void)systemMessage:(NSString *)message Handler:(void (^ __nullable)(UIAlertAction *action))handler;

#pragma mark ===其他
-(void)systemDismissMessage:(NSString *)message TimeInterval:(NSTimeInterval)timerInerval;

-(void)systemPopMessage:(NSString *)message;

-(void)systemPopRootMessage:(NSString *)message;


@end

NS_ASSUME_NONNULL_END

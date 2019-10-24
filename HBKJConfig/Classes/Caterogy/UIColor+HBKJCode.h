//
//  UIColor+HBKJCode.h
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HBKJCode)

#pragma mark ===根据16位进制获取颜色值(例如:0x666666)
+(UIColor *)colorFromCode:(int)hexCode;

+(UIColor *)colorFromCode:(int)hexCode Alpha:(float)alpha;

#pragma mark ===根据RGB获取颜色值
+(UIColor *)colorRGBRed:(float)red Green:(float)green Blue:(float)blue;

+(UIColor *)colorRGBRed:(float)red Green:(float)green Blue:(float)blue Alpha:(float)alpha;


@end

NS_ASSUME_NONNULL_END

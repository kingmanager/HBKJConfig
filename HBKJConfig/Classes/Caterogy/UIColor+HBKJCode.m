//
//  UIColor+HBKJCode.m
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/24.
//

#import "UIColor+HBKJCode.h"

@implementation UIColor (HBKJCode)

#pragma mark ===根据16位进制获取颜色值(例如:0xD90000)
+(UIColor *)colorFromCode:(int)hexCode{
    return [self colorFromCode:hexCode Alpha:1.0];
}
+(UIColor *)colorFromCode:(int)hexCode Alpha:(float)alpha{
    float red   = ((hexCode >> 16) & 0x000000FF)/255.0f;
    float green = ((hexCode >> 8) & 0x000000FF)/255.0f;
    float blue  = ((hexCode) & 0x000000FF)/255.0f;
    return [UIColor colorWithRed:red
                           green:green
                            blue:blue
                           alpha:alpha];
}

#pragma mark ===根据RGB获取颜色值
+(UIColor *)colorRGBRed:(float)red Green:(float)green Blue:(float)blue{
    return [self colorRGBRed:red Green:green Blue:blue Alpha:1.0];
}
+(UIColor *)colorRGBRed:(float)red Green:(float)green Blue:(float)blue Alpha:(float)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}


@end

//
//  NSString+HBKJExten.m
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/25.
//

#import "NSString+HBKJExten.h"

@implementation NSString (HBKJExten)

//1===char编码
+(NSString *)URLCharactersString:(NSString *)string{
    NSCharacterSet *charSet=[[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "] invertedSet];
    NSString *charStr=[string stringByAddingPercentEncodingWithAllowedCharacters:charSet];
    return charStr;
}

@end

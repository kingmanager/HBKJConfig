#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+HBKJChar.h"
#import "UIColor+HBKJCode.h"
#import "UIViewController+HBKJAlert.h"
#import "DeviceInfo.h"
#import "HBKJTools.h"
#import "HBKJDate.h"

FOUNDATION_EXPORT double HBKJConfigVersionNumber;
FOUNDATION_EXPORT const unsigned char HBKJConfigVersionString[];


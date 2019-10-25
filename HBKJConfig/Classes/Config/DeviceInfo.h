//
//  DeviceInfo.h
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/23.
//  Copyright © 2019 com.best. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceInfo : NSObject

//===版本号
+(NSString *)systemArchiveVersion;

//===操作系统版本号
+(NSString *)systemVersion;

//===手机型号
+(NSString *)systemPhoneModel;

@end

NS_ASSUME_NONNULL_END

//
//  HBKJDate.h
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/23.
//  Copyright © 2019 com.best. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    HBKJDatePickerDateType,
    HBKJDatePickerTimeType,
    HBKJDatePickerDateTimeType,
    HBKJDatePickerYearMonthType,
    HBKJDatePickerMonthDayType,
    HBKJDatePickerHourMinuteType,
    HBKJDatePickerDateHourMinuteType
} HBKJDatePickerType;

@interface HBKJDate : NSObject

+(instancetype)shareInstance;

//1.NSDate转String
-(NSString *)stringFromDate:(NSDate *)date HBKJDatePickerType:(HBKJDatePickerType)datePickerType;

//2.String转NSDate
-(NSDate *)dateFromString:(NSString *)string HBKJDatePickerType:(HBKJDatePickerType)datePickerType;

//3.获取附件日期名字
-(NSString *)getFileNamed;

//4.获取月初
-(NSString *)getStartOfMonth;

//5.获取月末
-(NSString *)getEndOfMonth;

//6.一(几)个月前的日期
-(NSString *)stringFrontMonthDate:(NSInteger)month;

//7.一(几)个月后的日期
-(NSString *)stringBackMonthDate:(NSInteger)month;

//8.判断日期是否为当天
-(BOOL)judgeIsTodayWithDate:(NSDate *)date;

//9.获取时间差
-(NSString *)getDistanceSecondsFrontTime:(NSString *)frontTime BackTime:(NSString *)backTime HBKJDatePickerType:(HBKJDatePickerType)datePickerType;

//10.判断时间大小 0:相等 1:frontTime>backTime 2:frontTime<backTime
-(NSInteger)compareFrontTime:(NSString *)frontTime BackTime:(NSString *)backTime HBKJDatePickerType:(HBKJDatePickerType)datePickerType;

@end

NS_ASSUME_NONNULL_END

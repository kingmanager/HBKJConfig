//
//  HBKJDate.m
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/23.
//  Copyright © 2019 com.best. All rights reserved.
//

#import "HBKJDate.h"

@implementation HBKJDate

+(instancetype)shareInstance{
    static HBKJDate *_hbkjDate=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _hbkjDate=[[HBKJDate alloc] init];
    });
    return _hbkjDate;
}

#pragma mark ===配置function
-(NSString *)dateFormatterBy:(HBKJDatePickerType)datePickerType{
    NSString *datePickerStr;
    switch (datePickerType) {
        case HBKJDatePickerDateType:
            datePickerStr=@"yyyy-MM-dd";
            break;
        case HBKJDatePickerTimeType:
            datePickerStr=@"HH:mm:ss";
            break;
        case HBKJDatePickerDateTimeType:
            datePickerStr=@"yyyy-MM-dd HH:mm:ss";
            break;
        case HBKJDatePickerYearMonthType:
            datePickerStr=@"yyyy-MM";
            break;
        case HBKJDatePickerMonthDayType:
            datePickerStr=@"MM-dd";
            break;
        case HBKJDatePickerHourMinuteType:
            datePickerStr=@"HH:mm";
            break;
        case HBKJDatePickerDateHourMinuteType:
            datePickerStr=@"yyyy-MM-dd HH:mm";
            break;
        default:
            datePickerStr=@"yyyy-MM-dd HH:mm:ss";
            break;
    }
    return datePickerStr;
    
}
- (NSString *)getLocaleIdentifier{
    NSArray *languages=[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *language=[languages objectAtIndex:0];
    return language;
}
-(NSInteger)daysOfMonth{
    NSCalendar *calendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range=[calendar rangeOfUnit:NSCalendarUnitDay
                                 inUnit:NSCalendarUnitMonth
                                forDate:[NSDate date]];
    return range.length;
}

#pragma mark ===操作function
//1.NSDate转String
-(NSString *)stringFromDate:(NSDate *)date HBKJDatePickerType:(HBKJDatePickerType)datePickerType{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:[self getLocaleIdentifier]]];
    [dateFormatter setDateFormat:[self dateFormatterBy:datePickerType]];
    NSString *outStr=[dateFormatter stringFromDate:date];
    return outStr;
}

//2.String转NSDate
-(NSDate *)dateFromString:(NSString *)string HBKJDatePickerType:(HBKJDatePickerType)datePickerType{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:[self getLocaleIdentifier]]];
    [dateFormatter setDateFormat:[self dateFormatterBy:datePickerType]];
    NSDate *outDate=[dateFormatter dateFromString:string];
    return outDate;
}

//3.获取附件日期名字
-(NSString *)getFileNamed{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:[self getLocaleIdentifier]]];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmssSSS"];
    NSString *fileNameStr=[dateFormatter stringFromDate:[NSDate date]];
    return fileNameStr;
}

//4.获取月初
-(NSString *)getStartOfMonth{
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSDateComponents *comps=[cal components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:[NSDate date]];
    comps.day=1;
    NSDate *startDate=[cal dateFromComponents:comps];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *outStr=[dateFormatter stringFromDate:startDate];
    return outStr;
}

//5.获取月末
-(NSString *)getEndOfMonth{
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSDateComponents *comps=[cal components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:[NSDate date]];
    NSInteger days=[self daysOfMonth];
    comps.day=days;
    NSDate *endDay=[cal dateFromComponents:comps];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *outStr=[dateFormatter stringFromDate:endDay];
    return outStr;
}

//6.一(几)个年(月，天)前(后)的日期:前- 后+
-(NSString *)stringDistanceTodayByYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
       
    NSCalendar *calendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComps=[[NSDateComponents alloc] init];
    [dateComps setYear:year];
    [dateComps setMonth:month];
    [dateComps setDay:day];
       
    NSDate *frontDate=[calendar dateByAddingComponents:dateComps toDate:[NSDate date] options:0];
    NSString *outStr=[dateFormatter stringFromDate:frontDate];
    return outStr;
}

//7.判断日期是否为当天
-(BOOL)judgeIsTodayByDate:(NSDate *)date{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    int unit=NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *todayComps=[calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *dateComps=[calendar components:unit fromDate:date];
    return (dateComps.year==todayComps.year) && (dateComps.month==todayComps.month) && (dateComps.day==todayComps.day);
}

//8:根据日期获取星期
-(NSString *)judgeWeekDayByDate:(NSDate *)date{
    NSArray *weekDays=[NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSCalendarUnit calendarUnit=NSCalendarUnitWeekday;
    NSDateComponents *theComponents=[calendar components:calendarUnit fromDate:date];
    return [weekDays objectAtIndex:theComponents.weekday];
}

//9.获取时间差(单位是秒)
-(NSString *)getDistanceSecondsFrontTime:(NSString *)frontTime BackTime:(NSString *)backTime HBKJDatePickerType:(HBKJDatePickerType)datePickerType{
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:[self dateFormatterBy:datePickerType]];
    NSDate *frontDate=[dateformatter dateFromString:frontTime];
    NSDate *backDate=[dateformatter dateFromString:backTime];
    
    NSTimeInterval values=[backDate timeIntervalSinceDate:frontDate];
    int second=(int)values;         //秒
    //int minute=(int)values/60;      //分钟
    //int house=(int)values/(3600);   //小时
    //int day=(int)values/(24*3600);  //天

    return [NSString stringWithFormat:@"%d",second];
}

//10.判断时间大小 0:相等 1:frontTime>backTime 2:frontTime<backTime
-(NSInteger)compareFrontTime:(NSString *)frontTime BackTime:(NSString *)backTime HBKJDatePickerType:(HBKJDatePickerType)datePickerType{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[self dateFormatterBy:datePickerType]];
    NSDate *frontDate=[dateFormatter dateFromString:frontTime];
    NSDate *backDate=[dateFormatter dateFromString:backTime];
    
    NSComparisonResult result=[frontDate compare:backDate];
    if (result==NSOrderedDescending) {
    //NSLog(@"frontTime  is in the future");
        return 1;
    }else if (result==NSOrderedAscending){
    //NSLog(@"frontTime is in the past");
        return 2;
    }
    //NSLog(@"Both dates are the same");
    return 0;
}

@end

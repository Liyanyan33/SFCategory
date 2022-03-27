//
//  NSDate+SFCategory.h
//  YYShop_OC
//
//  Created by liyanyan33 on 2022/3/25.
//

#import <Foundation/Foundation.h>

//日期时间格式
#define TIME_YMD_HMS    @"yyyy-MM-dd HH:mm:ss"
#define TIME_YMD        @"yyyy-MM-dd"
#define TIME_MD         @"MM-dd"
#define TIME_HM         @"HH:mm"
#define TIME_HMS        @"HH:mm:ss"
#define TIME_YMDHMS_SSS @"yyyy-MM-dd HH:mm:ss SSS"

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (SFCategory)

///将字符串转换成指定格式的日期 NSString --> NSDate
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)formatString;

///将日期转换成指定格式的字符串 NSDate --> NSString
+ (NSString *)stringWithDate:(NSDate *)date withFormat:(NSString *)formatString;

///计算两个日期之间相隔的天数
///例如:2022-3-15 与 2022-3-20 相隔 4天
+ (NSInteger)daysFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

///将日期转换成星期几 NSDate --> 星期几
///例如: 2022-3-25 --> 星期五
+ (NSString *)getWeekdayByDate:(NSDate *)date;

///将日期字符串转成 距离当前时间的指定格式
///例如:2022-3-24 10:12:33 最长字符串 19
///例如:2022-3-5 9:9:9     最短字符串 14
+ (NSString *)timeformat:(NSString *)formatString;

///将当前时间日期转换成指定格式的字符串 NSDate --> 字符串
+ (NSString *)nowTimeStringWithFormat:(NSString *)format;

///获取当前日期的时间戳(精确到毫秒) 字符串
+ (NSString *)getNowTimeTimestamp3;

///判断一个时间戳是否是今天
+ (BOOL)isTodayForTimeStamp3:(NSInteger)timeStamp3;

///判断一个时间戳是否是昨天
+ (BOOL)isYesterdayForTimeStamp3:(NSInteger)timeStamp3;

///判断一个时间戳是否是前天
+ (BOOL)isBeforeForTimeStamp3:(NSInteger)timeStamp3;

///将一个时间戳转换成日期 时间戳 --> NSDate
+ (NSDate *)dateWithTimestamp3:(NSInteger)timeStamp3;

///将一个时间戳转换成指定格式的字符串 时间戳 --> NSString
+ (NSString *)stringWithTimestamp3:(NSInteger)timeStamp3 format:(NSString*)format;

///将一个时间戳转换成指定格式的日期 时间戳 --> NSDate
+ (NSDate *)dateWithTimestamp3:(NSInteger)timeStamp3 format:(NSString*)format;

///获取月份
+ (NSInteger)getMonthWithDate:(NSDate *)date;

///获取天 -- 几号
+ (NSInteger)getDayWithDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END

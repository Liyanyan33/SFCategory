//
//  NSDate+SFCategory.m
//  YYShop_OC
//
//  Created by liyanyan33 on 2022/3/25.
//

#import "NSDate+SFCategory.h"

@implementation NSDate (SFCategory)

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)formatString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+ (NSString *)stringWithDate:(NSDate *)date withFormat:(NSString *)formatString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

+ (NSInteger)daysFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate{
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian ];
    NSUInteger unitFlags = NSCalendarUnitDay;
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:fromDate toDate:toDate  options:0];
    return [cps day];
}

+ (NSString *)getWeekdayByDate:(NSDate *)date{
    if (!date) {
        return nil;
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps =[calendar components:NSCalendarUnitWeekday fromDate:date];
    if (!comps) {
        return nil;
    }
    NSString *weekStr = nil;
    NSInteger week = [comps weekday];
    
    if(week == 1){
        weekStr = @"周日";
    }else if(week == 2){
        weekStr=@"周一";
    }else if(week == 3){
        weekStr = @"周二";
    }else if(week == 4){
        weekStr = @"周三";
    }else if(week == 5){
        weekStr = @"周四";
    }else if(week == 6){
        weekStr = @"周五";
    }else if(week == 7){
        weekStr = @"周六";
    }
    return weekStr;
}

+ (NSString *)timeformat:(NSString *)formatString {
    if (formatString == nil) {
        NSLog(@"日期字符串不能为空");
        return nil;
    }
    if (!(formatString.length >=14 && formatString.length <= 19)) {
        NSLog(@"日期字符串 格式不正确");
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:formatString];
    //秒数
    NSTimeInterval timeInteraval = [[NSDate date] timeIntervalSinceDate:date];
    long long interval = (long long)timeInteraval;
    if (interval < 60) {
        return @"刚刚";
    }else {
        //分钟
        long long minutes = interval/60;
        if (minutes < 60) {
            return [NSString stringWithFormat:@"%d分钟前",(int)minutes];
        }else {
            long long hours = minutes/60;
            if (hours < 24) {
                return [NSString stringWithFormat:@"%d小时前",(int)hours];
            }else {
                int days = (int)(hours/24);
                if(days<30){
                    return [NSString stringWithFormat:@"%d天前",days];
                }if(days>30&&days<360){
                    
                }
                switch (days/30) {
                    case 1:
                        return @"1个月前";
                        break;
                    case 2:
                        return @"2个月前";
                        break;
                    case 3:
                        return @"3个月前";
                        break;
                    case 4:
                        return @"4个月前";
                        break;
                    case 5:
                        return @"5个月前";
                        break;
                    case 6:
                        return @"6个月前";
                        break;
                    case 7:
                        return @"7个月前";
                        break;
                    case 8:
                        return @"8个月前";
                        break;
                    case 9:
                        return @"9个月前";
                        break;
                    case 10:
                        return @"10个月前";
                        break;
                    case 11:
                        return @"11个月前";
                        break;
                    default:
                        return @"一年前";
                        break;
                }
            }
        }
    }
}

+ (NSString *)nowTimeStringWithFormat:(NSString *)format {
    return [self stringWithDate:[NSDate date] withFormat:format];
}

//获取当前时间戳(以毫秒为单位)
+ (NSString *)getNowTimeTimestamp3 {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:TIME_YMDHMS_SSS];
    //----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970] * 1000];
    return timeSp;
}

+ (BOOL)isTodayForTimeStamp3:(NSInteger)timeStamp3{
    NSDate *timeDate = [self dateWithTimestamp3:timeStamp3];
    
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = TIME_YMD;
    
    NSString *dateStr = [fmt stringFromDate:timeDate];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}

+ (BOOL)isYesterdayForTimeStamp3:(NSInteger)timeStamp3{
    
    NSDate *timeDate = [self dateWithTimestamp3:timeStamp3];
    NSDate *now = [NSDate date];
    
    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = TIME_YMD;
    
    // 2014-04-30
    NSString *dateStr = [fmt stringFromDate:timeDate];
    // 2014-10-18
    NSString *nowStr = [fmt stringFromDate:now];
    
    // 2014-10-30 00:00:00
    NSDate *date = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

+ (BOOL)isBeforeForTimeStamp3:(NSInteger)timeStamp3{
    NSDate *timeDate = [self dateWithTimestamp3:timeStamp3];
    NSDate *now = [NSDate date];
    
    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = TIME_YMD;
    
    // 2014-04-30
    NSString *dateStr = [fmt stringFromDate:timeDate];
    // 2014-10-18
    NSString *nowStr = [fmt stringFromDate:now];
    
    // 2014-10-30 00:00:00
    NSDate *date = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 2;
}

+ (NSDate *)dateWithTimestamp3:(NSInteger)timeStamp3{
    NSString *timeStr = [NSString stringWithFormat:@"%ld",timeStamp3];
    NSTimeInterval time = 0;
    if (timeStr.length == 13) {
        time = [timeStr doubleValue] / 1000;
    }else{
        time = [timeStr doubleValue];
    }
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:time];
    return timeDate;
}

+ (NSString *)stringWithTimestamp3:(NSInteger)timeStamp3 format:(NSString *)format{
    NSDate *timeDate = [self dateWithTimestamp3:timeStamp3];
    NSDateFormatter *dFormat = [[NSDateFormatter alloc]init];
    [dFormat setDateFormat:format];
    NSString *timeStr = [dFormat stringFromDate:timeDate];
    return timeStr;
}

+ (NSDate *)dateWithTimestamp3:(NSInteger)timeStamp3 format:(NSString*)format{
    NSDate *timeDate = [self dateWithTimestamp3:timeStamp3];
    NSDateFormatter *dFormat = [[NSDateFormatter alloc]init];
    [dFormat setDateFormat:format];
    NSString *timeStr = [dFormat stringFromDate:timeDate];
    return [dFormat dateFromString:timeStr];
}

+ (NSInteger)getMonthWithDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSInteger month = [components month];
    return month;
}

+ (NSInteger)getDayWithDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSInteger day = [components day];
    return day;
}

@end

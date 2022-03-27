//
//  NSString+SFCategory.m
//  YYShop_OC
//
//  Created by liyanyan33 on 2022/3/24.
//

#import "NSString+SFCategory.h"

@implementation NSString (SFCategory)

- (BOOL)isEmpty {
    if (self == nil || [self isEqual:[NSNull null]] || self.length == 0 || [self isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

- (NSString *)removeSpaceAndNewLine{
    if ([self isEmpty]) return nil;
    NSString *str = [self mutableCopy];
    NSString *endStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return endStr;
}

- (NSString *)removeSpaces{
    if ([self isEmpty]) return nil;
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark 文本尺寸计算
- (CGFloat)calHeightWithFont:(UIFont *)font limitedWidth:(CGFloat)limitedWidth {
    CGSize size = CGSizeMake(limitedWidth, MAXFLOAT);
    CGFloat height = 0;
    ///iOS7适配
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    ///iOS7之后
    NSMutableDictionary *attr = [[NSMutableDictionary alloc]init];
    attr[NSFontAttributeName] = font;
    CGRect rect = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attr context:nil];
    height = rect.size.height;
#else
    ///iOS7之前
    CGSize size = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    height = size.height;
#endif
    return height;
}

#pragma mark 字符串格式化输出
- (BOOL)checkMobile {
    NSString *mobileNoRegex = @"1\\d{10}";
    NSPredicate *mobileNoTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileNoRegex];
    return [mobileNoTest evaluateWithObject:self];
}

- (NSString *)phoneNumberEncryption{
    NSString *newtel = [NSString stringWithFormat:@"%@", self];
    if ([self checkMobile]) {
        newtel = [self stringByReplacingCharactersInRange:NSMakeRange(3, 6) withString:@"******"];
    }
    return newtel;
}

@end

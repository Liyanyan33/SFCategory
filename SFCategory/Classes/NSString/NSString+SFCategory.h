//
//  NSString+SFCategory.h
//  YYShop_OC
//
//  Created by liyanyan33 on 2022/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SFCategory)

#pragma mark 空，空格处理
///是否为空
- (BOOL)isEmpty;

///去除首尾的空格和空行字符
- (NSString *)removeSpaceAndNewLine;

///去除所有空格
- (NSString *)removeSpaces;

#pragma mark 文本尺寸计算
///限制宽度 计算文本高度
- (CGFloat)calHeightWithFont:(UIFont *)font limitedWidth:(CGFloat)limitedWidth;

#pragma mark 字符串格式化输出
///校验有效手机号
- (BOOL)checkMobile;

///手机号中间六位脱敏 例如185******45
- (NSString *)phoneNumberEncryption;

@end

NS_ASSUME_NONNULL_END

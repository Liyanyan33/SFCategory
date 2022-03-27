//
//  UIColor+Extension.h
//  SN_Base
//
//  Created by liyanyan33 on 2019/8/12.
//  Copyright © 2019 liyanyan33. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SFCategory)

///例如: [UIColor colorWithRGBHex:0xdadada]
+ (UIColor *)colorWithRGBHex:(UInt32)hex;

///例如: [UIColor colorWithHexString:@"#333333"]
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end

NS_ASSUME_NONNULL_END

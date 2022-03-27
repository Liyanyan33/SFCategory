//
//  UIImage+Extension.h
//  YYShop_MVVM_OC
//
//  Created by liyanyan33 on 2022/3/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SFCategory)

///通过颜色创建图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

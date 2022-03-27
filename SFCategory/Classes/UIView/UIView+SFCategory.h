//
//  UIView+XSFAdd.h
//  SN_Base
//
//  Created by liyanyan33 on 2020/4/2.
//  Copyright © 2020 liyanyan33. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

#define hudViewTag 0x98751234
#define hudDelay 3.0

typedef NS_ENUM(NSInteger,MBProgressHUDPosition){
    MBProgressHUDPositionTop,
    MBProgressHUDPositionCenter,
    MBProgressHUDPositionBottom
};

@interface UIView (SFCategory)

#pragma mark HUD
///显示HUD 不会自动移除
- (void)showLoading;

///显示HUD 不会自动移除
- (void)showLoadingWithMessage:(NSString *)message;

///警告信息 在显示一段时间后 会自动移除 默认1秒钟 中间位置
- (void)showTipMessage:(NSString *)message;

///警告信息 在显示一段时间后 会自动移除 可指定时间 默认中间位置
- (void)showTipMessage:(NSString *)message afterDelay:(NSInteger)afterDelay;

///警告信息 在显示一段时间后 会自动移除 可指定显示位置
- (void)showTipMessage:(NSString *)message position:(MBProgressHUDPosition)position;

- (void)showTipMessage:(NSString *)message position:(MBProgressHUDPosition)position afterDelay:(NSInteger)afterDelay;

///警告信息 + 图片
- (void)showWarnMessage:(NSString *)message icon:(NSString *)icon;

- (void)showMessage:(NSString *)message icon:(NSString *)icon position:(MBProgressHUDPosition)position afterDelay:(NSInteger)afterDelay;

///移除HUD
- (void)hideHud;

#pragma mark Frame
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

#pragma mark Other
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;

- (void)setDirectionBorderWithTop:(BOOL)hasTopBorder left:(BOOL)hasLeftBorder bottom:(BOOL)hasBottomBorder right:(BOOL)hasRightBorder borderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth;

//截图图片
@property(nonatomic,readonly)UIImage *snapshotImage;
//内容图片
@property(nonatomic,strong)UIImage *contentImage;

@end


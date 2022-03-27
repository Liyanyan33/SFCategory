//
//  UIView+XSFAdd.m
//  SN_Base
//
//  Created by liyanyan33 on 2020/4/2.
//  Copyright © 2020 liyanyan33. All rights reserved.
//

#import "UIView+SFCategory.h"

@implementation UIView (SFCategory)

#pragma mark HUD
- (void)showLoading {
    [self showLoadingWithMessage:@""];
}

- (void)showLoadingWithMessage:(NSString *)message {
    MBProgressHUD *hud = [self getHud];
    if (hud == nil) {
        hud = [self createHUDWithMessage:message];
    }
    [self addSubview:hud];
    [hud show:YES];
}

- (void)showTipMessage:(NSString *)message {
    [self showTipMessage:message afterDelay:hudDelay];
}

- (void)showTipMessage:(NSString *)message afterDelay:(NSInteger)afterDelay {
    [self showTipMessage:message position:MBProgressHUDPositionCenter afterDelay:afterDelay];
}

- (void)showTipMessage:(NSString *)message position:(MBProgressHUDPosition)position {
    [self showTipMessage:message position:MBProgressHUDPositionCenter afterDelay:hudDelay];
}

- (void)showTipMessage:(NSString *)message icon:(NSString *)icon {
    [self showMessage:message icon:icon position:(MBProgressHUDPositionCenter) afterDelay:hudDelay];
}

- (void)showTipMessage:(NSString *)message position:(MBProgressHUDPosition)position afterDelay:(NSInteger)afterDelay {
    [self showMessage:message icon:nil position:position afterDelay:afterDelay];
}

- (void)showWarnMessage:(NSString *)message icon:(NSString *)icon {
    [self showMessage:message icon:icon position:(MBProgressHUDPositionCenter) afterDelay:hudDelay];
}

///核心方法
- (void)showMessage:(NSString *)message icon:(NSString *)icon position:(MBProgressHUDPosition)position afterDelay:(NSInteger)afterDelay {
    MBProgressHUD *hud = [self getHud];
    if (hud == nil) {
        hud = [self createHUDWithMessage:message];
    }
    [self addSubview:hud];
    [hud show:YES];
    
    if (icon != nil) { ///显示文字 + 图片
        hud.mode = MBProgressHUDModeCustomView;
        ///设置图片
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    } else { ///仅仅只显示文字
        hud.mode = MBProgressHUDModeText;
    }

    ///控制hud的显示位置
    NSLog(@"view height = %f",self.bounds.size.height);
    
    CGFloat offsetY = self.bounds.size.height / 2 - 92;
    if (position == MBProgressHUDPositionTop) {
        hud.yOffset = -offsetY;
    } else if (position == MBProgressHUDPositionCenter) {
        hud.yOffset = 0;
    } else {
        hud.yOffset = offsetY;
    }
    ///交互关闭
    hud.userInteractionEnabled = NO;
    
    ///可去除中间黑色背景框的透明度
    hud.opacity = 1.0;
    
    ///指定时间后 移除
    [hud hide:YES afterDelay:afterDelay];
}

- (void)hideHud {
    MBProgressHUD *hud = [self getHud];
    if (hud) {
        [hud hide:YES];
    }
}

///获取HUD控件
- (MBProgressHUD *)getHud {
    UIView *hudView = [self viewWithTag:hudViewTag];
    if (hudView != nil && [hudView isKindOfClass:[MBProgressHUD class]]) {
        return (MBProgressHUD *)hudView;
    } else {
        return nil;
    }
}

///根据tag获取HUD
- (UIView *)viewWithTag:(NSInteger)viewTag {
    for (UIView *subView in self.subviews) {
        if (subView.tag == viewTag) {
            return subView;
            break;
        }
    }
    return nil;
}

///创建HUD控件
- (MBProgressHUD *)createHUD {
   return [self createHUDWithMessage:@""];
}

- (MBProgressHUD *)createHUDWithMessage:(NSString *)message {
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self];
    hud.layer.zPosition = 10;
    hud.removeFromSuperViewOnHide = YES;
    if (message) {
//        hud.labelText = message;
        ///可实现文本的换行
        hud.detailsLabelText = message;
        hud.detailsLabelFont = [UIFont boldSystemFontOfSize:16];
    }
    hud.tag = hudViewTag;
    return hud;
}

#pragma mark Frame
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark Other
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius{
    CGRect rect = self.bounds;
    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}


- (void)setDirectionBorderWithTop:(BOOL)hasTopBorder left:(BOOL)hasLeftBorder bottom:(BOOL)hasBottomBorder right:(BOOL)hasRightBorder borderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth{
    
    float height = self.height;
    float width = self.width;

    CALayer *topBorder = [CALayer layer];
    topBorder.frame = CGRectMake(0, 0, width, borderWidth);
    topBorder.backgroundColor = borderColor.CGColor;
    
    CALayer *leftBorder = [CALayer layer];
    leftBorder.frame = CGRectMake(0, 0, 1, height);
    leftBorder.backgroundColor = borderColor.CGColor;
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0, height, width, borderWidth);
    bottomBorder.backgroundColor = borderColor.CGColor;
    
    CALayer *rightBorder = [CALayer layer];
    rightBorder.frame = CGRectMake(width, 0, borderWidth, height);
    rightBorder.backgroundColor = borderColor.CGColor;
    
    if (hasTopBorder) {
        [self.layer addSublayer:topBorder];
    }
    if (hasLeftBorder) {
        [self.layer addSublayer:leftBorder];
    }
    if (hasBottomBorder) {
        [self.layer addSublayer:bottomBorder];
    }
    if (hasRightBorder) {
        [self.layer addSublayer:rightBorder];
    }
}

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)contentImage{
    return [UIImage imageWithCGImage:(__bridge CGImageRef)self.layer.contents];
}

- (void)setContentImage:(UIImage *)contentImage{
    self.layer.contents = (__bridge id)contentImage.CGImage;;
}

@end

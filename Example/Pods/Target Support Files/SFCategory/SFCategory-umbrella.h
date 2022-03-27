#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SFCategory.h"
#import "NSArray+SFCategory.h"
#import "NSDate+SFCategory.h"
#import "NSString+SFCategory.h"
#import "UIColor+SFCategory.h"
#import "UIImage+SFCategory.h"
#import "UIView+SFCategory.h"

FOUNDATION_EXPORT double SFCategoryVersionNumber;
FOUNDATION_EXPORT const unsigned char SFCategoryVersionString[];


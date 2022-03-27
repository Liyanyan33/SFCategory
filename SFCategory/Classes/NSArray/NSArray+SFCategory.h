//
//  NSArray+Extension.h
//  YYShop_MVVM_OC
//
//  Created by liyanyan33 on 2022/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SFCategory)

- (id)safeObjectAtIndex:(NSUInteger)index;

- (id)deepCopy;
- (id)mutableDeepCopy;

- (id)trueDeepCopy;
- (id)trueDeepMutableCopy;

@end

@interface NSMutableArray (CheckIndex)

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (void)safeAddObject:(id)anObject;
- (void)safeRemoveObjectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END

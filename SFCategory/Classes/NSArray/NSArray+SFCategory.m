//
//  NSArray+Extension.m
//  YYShop_MVVM_OC
//
//  Created by liyanyan33 on 2022/3/17.
//

#import "NSArray+SFCategory.h"

@implementation NSArray (SFCategory)

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (self.count > index) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (id)deepCopy {
    return [[NSArray alloc] initWithArray:self copyItems:YES];
}

- (id)mutableDeepCopy {
    return [[NSMutableArray alloc] initWithArray:self copyItems:YES];
}

- (id)trueDeepCopy {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]];
}

- (id)trueDeepMutableCopy {
    return [[NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]] mutableCopy];
}

@end


@implementation NSMutableArray (CheckIndex)
 
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    if (self.count > index ) {
        [self replaceObjectAtIndex:index withObject:object];
    }
}

- (void)safeAddObject:(id)anObject{
    NSAssert(anObject != nil, @"Argument must be non-nil");
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count > index) {
        [self removeObjectAtIndex:index];
    }
}

@end

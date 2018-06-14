//
//  ARCRetainCount.h
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/13.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARCRetainCount : NSObject
- (void)getRetainCountOfImmutable;
- (void)getRetainCountOfMutable;
- (void)convenienceInitRelease;
@end

NS_ASSUME_NONNULL_END

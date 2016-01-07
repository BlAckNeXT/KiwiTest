//
//  Stack.h
//  podtest
//
//  Created by 雪剑 on 15/5/21.
//  Copyright (c) 2015年 雪剑. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

- (void)push:(double) numberToPush;
- (double)top;
- (void)clear;
- (double)pop;

@end

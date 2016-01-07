//
//  Stack.m
//  podtest
//
//  Created by 雪剑 on 15/5/21.
//  Copyright (c) 2015年 雪剑. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property(nonatomic,retain) NSMutableArray *data;

@end

@implementation Stack

@synthesize data = _data;
- (id) init {
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return self;
}

- (void) push:(double)numberToPush {
    [self.data addObject:[NSNumber numberWithDouble:numberToPush]];
}

- (double)top {
    return [[self.data lastObject] doubleValue];
}

- (NSUInteger)count {
    return [self.data count];
}

- (void) clear {
    [self.data removeAllObjects];
}

- (double)pop {
    double poppedValue = [self top];
    if (![self.data lastObject]) {
        [NSException raise:@"EmptyStackPopException"
                    format:@"Pop was sent to an empty stack"];
        
    }
    [self.data removeLastObject];
    return poppedValue;
}


@end

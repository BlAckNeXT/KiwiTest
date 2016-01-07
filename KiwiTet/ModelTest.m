//
//  ModelTest.m
//  podtest
//
//  Created by 雪剑 on 15/5/20.
//  Copyright (c) 2015年 雪剑. All rights reserved.
//

#import "ModelTest.h"

@implementation ModelTest

+(ModelTest *)sharedModel
{
    static ModelTest *sharedModelInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModelInstance = [[ModelTest alloc] init];
    });
    return sharedModelInstance;
}

@end

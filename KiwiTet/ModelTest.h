//
//  ModelTest.h
//  podtest
//
//  Created by 雪剑 on 15/5/20.
//  Copyright (c) 2015年 雪剑. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelTest : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *age;

+(ModelTest *)sharedModel;

@end

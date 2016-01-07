//
//  KiwiTetTests.m
//  KiwiTetTests
//
//  Created by 雪剑 on 15/5/21.
//  Copyright (c) 2015年 雪剑. All rights reserved.
//


#import "Kiwi.h"
#import "ModelTest.h"
#import "ViewController.h"
#import "Stack.h"

/**
 *  字符串测试
 */
SPEC_BEGIN(StringTest)
describe(@"In our first Kiwi test", ^{
    context(@"a sample string", ^{
        NSString *greeting = @"Hi";//Hello, World!";
        it(@"should exist.", ^{
            [greeting shouldNotBeNil];
        });
        it(@"it length should longer than 0", ^{
            [[theValue(greeting.length) shouldNot] equal:theValue(0)];
        });
        it(@"should be 'Hello, World!'.", ^{
            [[greeting should] equal:@"Hi"];
        });
    });
});
SPEC_END

/**
 *  数字类测试
 */
SPEC_BEGIN(NumberTest)
describe(@"numberTest", ^{
    context(@"a number", ^{
        NSInteger number1 = 4;
        NSInteger number2 = 5;
        it(@"should not zero", ^{
            [[theValue(number1 + number2) should] equal:theValue(9)];
        });
    });
});
SPEC_END

/**
 *  模型属性测试
 */
SPEC_BEGIN(ModelProTest)
describe(@"modelTest", ^{
    context(@"model", ^{
        __block ModelTest *model = nil;
        beforeEach(^{
            model = [ModelTest sharedModel];
        });
        afterEach(^{
            model = [ModelTest sharedModel];
        });
        
        it(@"it should not be nil", ^{
            [[model shouldNot] beNil];
        });
        
        it(@"it's name's length should be 0", ^{
            [[theValue(model.name.length) should] equal:theValue(0)];
        });
        
        it(@"it's age must be nil", ^{
            [[model.age should] beNil];
        });
    });
    
});
SPEC_END

/**
 *  其他测试
 */

SPEC_BEGIN(testBtnTest)
describe(@"testBtnTest", ^{
    context(@"testBtnTest", ^{
        it(@"it should not be nil", ^{
            id VC = [ViewController mock];
            [VC stub:@selector(testMock) andReturn:theValue(19)];
            //           [[VC should]receive:@selector(testMock) andReturn:theValue(18)];
        });
    });
    
});

SPEC_END


SPEC_BEGIN(StackSpec)
describe(@"The stack", ^{
    context(@"when created", ^{
        Stack *stack = [[Stack alloc] init];
        it(@"is not nil.", ^{
            [stack shouldNotBeNil];
        });
        it(@"is empty", ^{
            [[stack should] beEmpty];
        });
        it(@"allows me to add a double to it.", ^{
            [stack push:5.3];
            [[stack should] haveCountOf:1];
            [[theValue([stack top]) should] equal:5.3 withDelta:.001];
        });
    });
});
SPEC_END

SPEC_BEGIN(StackSpec2)

describe(@"The stack", ^{
    Stack *stack = [[Stack alloc] init];
    afterEach(^{
        [stack clear];
    });
    context(@"when created", ^{
        it(@"is not nil.", ^{
            [stack shouldNotBeNil];
        });
        it(@"allows me to add a double to it.", ^{
            [stack push:5.3];
            [[stack should] haveCountOf:1];
            [[theValue([stack top]) should] equal:5.3 withDelta:.001];
        });
        it(@"is empty", ^{
            [[stack should] beEmpty];
        });
    });
    context(@"after pushing 4.7 on an empty stack", ^{
        beforeEach(^{
            [stack push:4.7];
            [stack push:5.5];
        });
        
        it(@"has exactly one element.", ^{
            [[stack should] haveCountOf:2];
        });
        
        it(@"has 4.7 as top.", ^{
            [[theValue([stack top]) should] equal:5.5 withDelta:.001];
        });
    });
});
SPEC_END


SPEC_BEGIN(StackSpec3)
describe(@"The stack", ^{
    Stack *stack = [[Stack alloc] init];
    afterEach(^{
        [stack clear];
    });
    context(@"when created", ^{
        it(@"is not nil.", ^{
            [stack shouldNotBeNil];
        });
        
        it(@"is empty", ^{
            [[stack should] beEmpty];
        });
        it(@"returns 0 for top", ^{
            [[theValue([stack top]) should] beZero];
        });
        it(@"throws an exception when I pop an empty stack.", ^{
            [[theBlock(^{
                [stack pop];
            }) should] raiseWithName:@"EmptyStackPopException"];
        });
    });
    context(@"after pushing 4.7 on an empty stack", ^{
        beforeEach(^{
            [stack push:4.7];
        });
        it(@"has exactly one element.", ^{
            [[stack should] haveCountOf:1];
        });
        it(@"has 4.7 as top.", ^{
            [[theValue([stack top]) should] equal:4.7 withDelta:.001];
        });
        it(@"returns 4.7 from pop and then is empty.", ^{
            [[theValue([stack pop]) should] equal:4.7 withDelta:.001];
            [[stack should] beEmpty];
        });
    });
});
SPEC_END

SPEC_BEGIN(VCTest)
describe(@"testSomeMethod", ^{
   context(@"testArray", ^{
       NSArray *array = @[@"123",@"12321",@"3532",@"dsf"];
       it(@"should have contains", ^{
           [[theValue(array.count) should] equal:theValue(4)];
       });
   });
    
    context(@"testView", ^{
        ViewController *vc = [[ViewController alloc]init];
        it(@"should be a kind of ViewController", ^{
            [[vc should] beKindOfClass:[ViewController class]];
        });
        
        it(@"should receive a method", ^{
            [vc stub:@selector(vctest)];
        });
        
        it(@"should through method get true number", ^{
            [[theValue([vc vctest]) should] equal:theValue(5)];
        });
        
        it(@"should get a button", ^{
            [[[vc updateBtn] shouldNot] beNil];
        });
        
    });
    
});

SPEC_END

SPEC_BEGIN(NetworkTest)
describe(@"network method test", ^{
    context(@"testMock", ^{
        id VC = [ViewController mock];
        [[theValue([VC vctest]) should] equal:theValue(5)];
        [[VC expect] vctest];
        [[VC expect] viewDidLoad];
        [[VC expect] viewDidAppear:YES];
        [VC stub:@selector(vctest) andReturn:theValue(5)];
    });
    
});

SPEC_END






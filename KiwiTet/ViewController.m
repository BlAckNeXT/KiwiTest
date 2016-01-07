//
//  ViewController.m
//  KiwiTet
//
//  Created by 雪剑 on 15/5/21.
//  Copyright (c) 2015年 雪剑. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIButton *testBtn;
@property(nonatomic,retain) NSMutableArray *data;

@end

@implementation ViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self vctest];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_testBtn setTitle:@"测试" forState:UIControlStateNormal];
    [_testBtn addTarget:self action:@selector(testBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_testBtn];
    
    _data = [[NSMutableArray alloc] initWithCapacity:4];
    
    [self vctest];
}

- (void)testBtnAction:(UIButton *)sender
{
    NSLog(@"1232132131");
}

- (NSInteger)vctest
{
    return 5;
}

- (UIButton *)updateBtn{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"点击更新版本信息" forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.frame = CGRectMake(0, 0, 200, 40);
    button.center = self.view.center;
    [button addTarget:self action:@selector(testBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

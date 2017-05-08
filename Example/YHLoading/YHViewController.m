//
//  YHViewController.m
//  YHLoading
//
//  Created by 814325429@qq.com on 05/08/2017.
//  Copyright (c) 2017 814325429@qq.com. All rights reserved.
//

#import "YHViewController.h"
#import <YHLoading/UIViewController+Loading.h>
@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showLoading];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hide];
}

@end

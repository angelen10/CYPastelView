//
//  ViewController.m
//  PastelView
//
//  Created by angelen on 2017/5/16.
//  Copyright © 2017年 angelen. All rights reserved.
//

#import "ViewController.h"
#import "CYPastelView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CYPastelView *pastelView = [[CYPastelView alloc] initWithFrame:self.view.bounds];
    pastelView.animationDuration = 3.0;
    [pastelView startAnimation];
    [self.view insertSubview:pastelView atIndex:0];
}

@end

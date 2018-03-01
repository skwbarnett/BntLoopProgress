//
//  MainViewController.m
//  BntLoopProgress
//
//  Created by 吴克赛 on 2018/3/1.
//  Copyright © 2018年 BarnettWu. All rights reserved.
//

#import "MainViewController.h"
#import "BntLoopProgress.h"
#define SELF_WIDTH CGRectGetWidth(self.view.bounds)
#define SELF_HEIGHT CGRectGetHeight(self.view.bounds)

@interface MainViewController ()

@property (nonatomic, strong) UISlider *percentSlider;

@property (nonatomic, strong) BntLoopProgress *loopProgress;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loopProgress.percent = 0.9;
    [self.view addSubview:_loopProgress];
    [self.view addSubview:self.percentSlider];
}

- (void)percentValueControlWithSlider:(UISlider *)slider {
    [self.loopProgress setPercentWithAnimation:slider.value];
    NSLog(@"\n***************************\nloopPercent : %5.2f %%", _percentSlider.value * 100);
}

- (UISlider *)percentSlider {
    if (_percentSlider == nil) {
        _percentSlider = [[UISlider alloc] initWithFrame:CGRectMake(60, 400, 250, 50)];
        [_percentSlider addTarget:self action:@selector(percentValueControlWithSlider:) forControlEvents:UIControlEventValueChanged];
    }
    return _percentSlider;
}

- (BntLoopProgress *)loopProgress {
    if (_loopProgress == nil) {
        CGFloat loopr = 208;
        CGFloat loopw = loopr * 1.25;
        CGFloat loopLM = (SELF_WIDTH - loopw) * 0.5;
        _loopProgress = [[BntLoopProgress alloc] initWithFrame:CGRectMake(loopLM, 120, loopw,loopw)];
    }
    return _loopProgress;
}

@end

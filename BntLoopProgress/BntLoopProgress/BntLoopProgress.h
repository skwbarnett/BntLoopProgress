//
//  BntLoopProgress.h
//  BntLoopProgress
//
//  Created by 吴克赛 on 2017/7/26.
//  Copyright © 2017年 BarnettWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BntLoopProgress : UIView

@property (nonatomic, assign) CGFloat percent;

- (void)setPercentWithAnimation:(CGFloat)strokeEnd;

@end

//
//  BntLoopProgress+Configuration.h
//  BntLoopProgress
//
//  Created by 吴克赛 on 2017/7/26.
//  Copyright © 2017年 BarnettWu. All rights reserved.
//

#import "BntLoopProgress.h"

@interface BntLoopProgress (Configuration)

/** 配色 */
+ (UIColor *)zeroColor;

+ (UIColor *)startColor;

+ (UIColor *)centerColor;

+ (UIColor *)endColor;

+ (UIColor *)backgroundColor;

+ (CGFloat)lineWidth;

+ (CGFloat)startAngle;

+ (CGFloat)endAngle;

@end

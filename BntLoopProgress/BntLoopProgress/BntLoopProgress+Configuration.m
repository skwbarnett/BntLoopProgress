//
//  BntLoopProgress+Configuration.m
//  BntLoopProgress
//
//  Created by 吴克赛 on 2017/7/26.
//  Copyright © 2017年 BarnettWu. All rights reserved.
//

#import "BntLoopProgress+Configuration.h"

#define DEGREES_TO_RADOANS(x) (M_PI * (x) / 180.0) // 将角度转为弧度

@implementation BntLoopProgress (Configuration)

+ (UIColor *)zeroColor {
    return [UIColor whiteColor];
}

+ (UIColor *)startColor {
    
    return [UIColor greenColor];
}

+ (UIColor *)centerColor {
    
    return [UIColor yellowColor];
}

+ (UIColor *)endColor {
    
    return [UIColor redColor];
}

+ (UIColor *)backgroundColor {
    
    return [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.00];
}

+ (CGFloat)lineWidth {
    
    return 5;
}

+ (CGFloat)startAngle {
    
    return DEGREES_TO_RADOANS(-226);
}

+ (CGFloat)endAngle {
    
    return DEGREES_TO_RADOANS(46);
}


@end

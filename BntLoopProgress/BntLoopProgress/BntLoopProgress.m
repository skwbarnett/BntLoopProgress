//
//  BntLoopProgress.m
//  BntLoopProgress
//
//  Created by 吴克赛 on 2017/7/26.
//  Copyright © 2017年 BarnettWu. All rights reserved.
//

#import "BntLoopProgress.h"
#import "POP.h"

#import "BntLoopProgress+Configuration.h"

#define SELF_WIDTH CGRectGetWidth(self.bounds)
#define SELF_HEIGHT CGRectGetHeight(self.bounds)

@interface BntLoopProgress ()

@property (nonatomic, strong) CAShapeLayer *colorMaskLayer;  // 渐变色mask

@property (nonatomic, strong) CAShapeLayer *colorLayer; // 渐变色

@property (nonatomic, strong) CAShapeLayer *blueMaskLayer; // 蓝色mask

@end

@implementation BntLoopProgress

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [BntLoopProgress backgroundColor];
        [self setupColorLayer];
        [self setupBlueMaskLayer];
        [self setupColorMaskLayer];
    }
    return self;
}


/** 蓝色mask */
- (void)setupBlueMaskLayer {
    CAShapeLayer *layer = [self mainMaskLayer];
    self.layer.mask = layer;
    self.blueMaskLayer = layer;
}

/** 渐变mask */
- (void)setupColorMaskLayer {
    CAShapeLayer *layer = [self mainMaskLayer];
    layer.lineWidth = layer.lineWidth + 0.5;
    self.colorLayer.mask = layer;
    self.colorMaskLayer = layer;
}


/**
 *  设置渐变色，渐变色由左右两个部分组成
 */
- (void)setupColorLayer {
    
    self.colorLayer = [CAShapeLayer layer];
    self.colorLayer.frame = self.bounds;
    [self.layer addSublayer:self.colorLayer];
    
    CGFloat leftW = SELF_WIDTH * 0.6;
    
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, leftW, SELF_HEIGHT);
    // 分段设置渐变色
    leftLayer.locations = @[@0.15,@0.5,@0.85, @1];
    leftLayer.startPoint = CGPointMake(0.8, 0);
    leftLayer.endPoint = CGPointMake(0.3, 1);
    leftLayer.colors = @[(id)[BntLoopProgress centerColor].CGColor, (id)[BntLoopProgress startColor].CGColor,(id)[BntLoopProgress zeroColor].CGColor];
    [self.colorLayer addSublayer:leftLayer];
    
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(leftW, 0, SELF_WIDTH - leftW, SELF_HEIGHT);
    rightLayer.startPoint = CGPointMake(0.5, 0);
    rightLayer.endPoint = CGPointMake(0.7, 1);
    rightLayer.locations = @[@0.25, @0.9,@1];
    rightLayer.colors = @[(id)[BntLoopProgress centerColor].CGColor, (id)[BntLoopProgress endColor].CGColor];
    [self.colorLayer addSublayer:rightLayer];
}

- (CAShapeLayer *)mainMaskLayer {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SELF_WIDTH / 2, SELF_HEIGHT / 2) radius:SELF_WIDTH * 0.4 startAngle:[BntLoopProgress startAngle] endAngle:[BntLoopProgress endAngle] clockwise:YES];
    
    layer.lineWidth = [BntLoopProgress lineWidth];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.lineCap = kCALineCapRound;//圆角
    
    return layer;
}



- (void)setPercent:(CGFloat)strokeEnd {
    
    _percent = strokeEnd;
    self.colorMaskLayer.strokeEnd = strokeEnd;
}

- (void)setPercentWithAnimation:(CGFloat)strokeEnd {
    POPSpringAnimation *strokenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    strokenAnimation.toValue = @(strokeEnd);
    strokenAnimation.springBounciness = 12.f;
    strokenAnimation.removedOnCompletion = NO;
    [self.colorMaskLayer pop_addAnimation:strokenAnimation forKey:@"layerStrokeAnimation"];
    
}


@end

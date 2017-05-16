//
//  CYPastelView.m
//  PastelView
//
//  Created by angelen on 2017/5/16.
//  Copyright © 2017年 angelen. All rights reserved.
//

#import "CYPastelView.h"

static NSString * const CYAnimationKeyPath = @"colors";
static NSString * const CYAnimationKey     = @"ColorChange";

@interface CYPastelView () <CAAnimationDelegate>

@property (strong, nonatomic) CAGradientLayer *gradient;
@property (assign, nonatomic) NSUInteger currentGradient;

@end

@implementation CYPastelView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    [self.gradient removeAllAnimations];
    [self.gradient removeFromSuperlayer];
}

#pragma mark - Public Methods

- (void)startAnimation {
    [self.gradient removeAllAnimations];
    [self setupGradient];
    [self animateGradient];
}

- (void)setColors:(NSArray<UIColor *> *)colors {
    if (colors.count > 0) {
        _colors = colors;
    } else {
        return;
    }
}

#pragma mark - Private Methods

// 一些初始化数据
- (void)setup {
    self.gradient = [CAGradientLayer layer];
    self.gradient.frame = self.bounds;
    self.currentGradient = 0;
    self.animationDuration = 3.0;
    self.colors = @[[UIColor colorWithRed:156/255.0 green:39/255.0 blue:176/255.0 alpha:1.0],
                    [UIColor colorWithRed:255/255.0 green:64/255.0 blue:176/255.0 alpha:1.0],
                    [UIColor colorWithRed:123/255.0 green:31/255.0 blue:162/255.0 alpha:1.0],
                    [UIColor colorWithRed:32/255.0 green:76/255.0 blue:255/255.0 alpha:1.0],
                    [UIColor colorWithRed:32/255.0 green:158/255.0 blue:255/255.0 alpha:1.0],
                    [UIColor colorWithRed:90/255.0 green:120/255.0 blue:127/255.0 alpha:1.0],
                    [UIColor colorWithRed:58/255.0 green:255/255.0 blue:217/255.0 alpha:1.0],];
}

- (void)setupGradient {
    self.gradient.colors = [self currentGradientSet];
    self.gradient.startPoint = CGPointMake(0.0, 1.0);
    self.gradient.endPoint = CGPointMake(1.0, 0.0);
    self.gradient.drawsAsynchronously = YES;
    [self.layer insertSublayer:self.gradient atIndex:0];
}

- (void)animateGradient {
    self.currentGradient += 1;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:CYAnimationKeyPath];
    animation.duration = self.animationDuration;
    animation.toValue = [self currentGradientSet];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    [self.gradient addAnimation:animation forKey:CYAnimationKey];
}

- (NSArray *)currentGradientSet {
    if (self.colors.count > 0) {
        return [NSArray arrayWithObjects:(id)(self.colors[self.currentGradient % self.colors.count].CGColor), (id)(self.colors[(self.currentGradient + 1) % self.colors.count].CGColor), nil];
    } else {
        return @[];
    }
}

#pragma mark - <CAAnimationDelegate>
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        self.gradient.colors = [self currentGradientSet];
        [self animateGradient];
    }
}

@end

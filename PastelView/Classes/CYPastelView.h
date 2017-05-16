//
//  CYPastelView.h
//  PastelView
//
//  Created by angelen on 2017/5/16.
//  Copyright © 2017年 angelen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYPastelView : UIView

// Custom Duration
@property (assign, nonatomic) NSTimeInterval animationDuration;

@property (strong, nonatomic) NSArray<UIColor *> *colors;

- (void)startAnimation;

@end

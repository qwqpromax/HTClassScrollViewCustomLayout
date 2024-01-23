//
//  UIView+HTClassFrameView.m
//  CommonOCProject
//
//  Created by ajie on 2024/1/9.
//

#import "UIView+HTClassFrameView.h"

@implementation UIView(HTClassFrameView)
- (CGFloat)var_x {
    return self.frame.origin.x;
}

- (void)setVar_x:(CGFloat)var_x {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = var_x;
    self.frame        = newFrame;
}

- (CGFloat)var_y {
    return self.frame.origin.y;
}

- (void)setVar_y:(CGFloat)var_y {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = var_y;
    self.frame        = newFrame;
}

- (CGFloat)var_centerX {
    return self.center.x;
}

- (void)setVar_centerX:(CGFloat)var_centerX {
    CGPoint newCenter = self.center;
    newCenter.x       = var_centerX;
    self.center       = newCenter;
}

- (CGFloat)var_centerY {
    return self.center.y;
}

- (void)setVar_centerY:(CGFloat)var_centerY {
    CGPoint newCenter = self.center;
    newCenter.y       = var_centerY;
    self.center       = newCenter;
}

@end

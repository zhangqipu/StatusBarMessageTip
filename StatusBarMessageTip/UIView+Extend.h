//
//  UIView+Extend.h
//  TmallClient4iOS-Prime
//
//  Created by casa on 14/12/8.
//  Copyright (c) 2014年 casa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extend)

// coordinator getters
- (CGFloat)height;
- (CGFloat)width;
- (CGFloat)x;
- (CGFloat)y;
- (CGSize)size;
- (CGPoint)origin;
- (CGFloat)centerX;
- (CGFloat)centerY;
- (CGFloat)bottom;
- (CGFloat)right;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;

// height
- (void)setHeight:(CGFloat)height;
- (void)heightEqualToView:(UIView *)view;

// width
- (void)setWidth:(CGFloat)width;
- (void)widthEqualToView:(UIView *)view;

// center
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;

// top, bottom, left, right
- (void)top:(CGFloat)top FromView:(UIView *)view;
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view;
- (void)left:(CGFloat)left FromView:(UIView *)view;
- (void)right:(CGFloat)right FromView:(UIView *)view;

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;

- (void)topEqualToView:(UIView *)view;
- (void)bottomEqualToView:(UIView *)view;
- (void)leftEqualToView:(UIView *)view;
- (void)rightEqualToView:(UIView *)view;

// size
- (void)setSize:(CGSize)size;
- (void)sizeEqualToView:(UIView *)view;

// imbueset
- (void)fillWidth;
- (void)fillHeight;
- (void)fill;

- (UIView *)topSuperView;

- (UIView *)circleSelf;

@end
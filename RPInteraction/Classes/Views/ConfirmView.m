//
//  ConfirmView.m
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/9/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import "ConfirmView.h"
#import "AnimationFactory.h"
#import "LayerFactory.h"

@implementation ConfirmView {
    CALayer *gradientLayer;
}

- (void)configureSubmitButtonWithTitle:(NSString *)title
                           badGradient:(Gradient *)badGradient
                           ughGradient:(Gradient *)ughGradient
                            okGradient:(Gradient *)okGradient
                          goodGradient:(Gradient *)goodGradient {
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    _button.frame = CGRectMake(self.bounds.size.width / 2 - 75, self.bounds.size.height / 8, 150, 50);
    _button.layer.cornerRadius = _button.frame.size.height / 2;
    [_button setTitle:title forState:UIControlStateNormal];
    [_button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];

    CAAnimation *gradientAnimation = [AnimationFactory gradientAnimationWithBadGradient:badGradient
                                                                            ughGradient:ughGradient
                                                                             okGradient:okGradient
                                                                           goodGradient:goodGradient];
    gradientLayer = [LayerFactory gradientLayerWithMask:nil frame:_button.bounds];
    gradientLayer.cornerRadius = _button.layer.cornerRadius;
    [_button.layer insertSublayer:gradientLayer atIndex:0];
    [gradientLayer addAnimation:gradientAnimation forKey:@"animateGradient"];
    gradientLayer.speed = 0;

    [self addSubview:_button];
}

- (void)configureWithBackgroundColor:(UIColor *)backgroundColor
                               title:(NSString *)title
                         badGradient:(Gradient *)badGradient
                         ughGradient:(Gradient *)ughGradient
                          okGradient:(Gradient *)okGradient
                        goodGradient:(Gradient *)goodGradient {
    self.backgroundColor = backgroundColor;
    self.layer.cornerRadius = self.bounds.size.width / 2;
    self.layer.shadowColor = UIColor.blackColor.CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 10;
    self.layer.shadowOpacity = 0.3;
    [self configureSubmitButtonWithTitle:(NSString *)title
                             badGradient:badGradient
                             ughGradient:ughGradient
                              okGradient:okGradient
                            goodGradient:goodGradient];
}

- (void)updateLayers:(CGFloat)progress {
    gradientLayer.timeOffset = progress;
}

@end

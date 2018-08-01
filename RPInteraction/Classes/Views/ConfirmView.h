//
//  ConfirmView.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/9/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gradient.h"

@interface ConfirmView : UIView

@property (strong, nonatomic) UIButton *button;

- (void)configureWithBackgroundColor:(UIColor *)backgroundColor
                               title:(NSString *)title
                         badGradient:(Gradient *)badGradient
                         ughGradient:(Gradient *)ughGradient
                          okGradient:(Gradient *)okGradient
                        goodGradient:(Gradient *)goodGradient;
- (void)updateLayers:(CGFloat)progress;

@end

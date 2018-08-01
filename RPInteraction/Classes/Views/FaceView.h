//
//  FaceView.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 3/30/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gradient.h"

@interface FaceView : UIView

- (void)configureWithBackgroundColor:(UIColor *)backgroundColor
                         badGradient:(Gradient *)badGradient
                         ughGradient:(Gradient *)ughGradient
                          okGradient:(Gradient *)okGradient
                        goodGradient:(Gradient *)goodGradient;
- (void)updateLayers:(CGFloat)progress;

@end

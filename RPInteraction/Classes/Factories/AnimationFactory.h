//
//  AnimationFactory.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 3/30/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPRate.h"
#import "Gradient.h"

@interface AnimationFactory : NSObject

+ (CAAnimation *)mouthAnimationWithFrame:(CGRect)frame;
+ (CAAnimation *)eyeCircleCoverAnimationWithOffset:(CGFloat)offset;
+ (CAAnimation *)eyeRectCoverAnimationWithOffset:(CGFloat)offset;
+ (CAAnimation *)descriptionAnimationWithRate:(RPRate)rate offset:(CGFloat)offset;
+ (CAAnimation *)gradientAnimationWithBadGradient:(Gradient *)badGradient
                                      ughGradient:(Gradient *)ughGradient
                                       okGradient:(Gradient *)okGradient
                                     goodGradient:(Gradient *)goodGradient;

@end

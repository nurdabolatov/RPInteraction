//
//  FaceView.m
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 3/30/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import "AnimationFactory.h"
#import "LayerFactory.h"
#import "FaceView.h"

@implementation FaceView {
    NSMutableArray *layers;
    NSObject *test;
}

- (void)configureMouthWithBadGradient:(Gradient *)badGradient
                          ughGradient:(Gradient *)ughGradient
                           okGradient:(Gradient *)okGradient
                         goodGradient:(Gradient *)goodGradient {
    CGPoint mouthCenter = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 + 45);
    CGRect mouthFrame = CGRectMake(mouthCenter.x - 50, mouthCenter.y - 27.5, 100, 55);

    CAAnimation *mouthAnimation = [AnimationFactory mouthAnimationWithFrame:mouthFrame];
    CAAnimation *gradientAnimation = [AnimationFactory gradientAnimationWithBadGradient:badGradient
                                                                            ughGradient:ughGradient
                                                                             okGradient:okGradient
                                                                           goodGradient:goodGradient];

    CALayer *mouthLayer = [LayerFactory mouthLayer];
    CALayer *gradientLayer = [LayerFactory gradientLayerWithMask:mouthLayer frame:mouthFrame];

    [self.layer addSublayer:gradientLayer];

    [mouthLayer addAnimation:mouthAnimation forKey:@"animateMouth"];
    [gradientLayer addAnimation:gradientAnimation forKey:@"animateMouthGradient"];

    mouthLayer.speed = 0;
    gradientLayer.speed = 0;

    [layers addObjectsFromArray:@[mouthLayer, gradientLayer]];
}

- (void)configureEyesWithBackgroundColor:(UIColor *)backgroundColor
                             badGradient:(Gradient *)badGradient
                             ughGradient:(Gradient *)ughGradient
                              okGradient:(Gradient *)okGradient
                            goodGradient:(Gradient *)goodGradient {
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGRect leftEyeFrame = CGRectMake(center.x - 45, center.y - 35, 30, 30);
    CGRect leftEyeCircleCoverFrame = CGRectMake(center.x - 60, center.y - 52, 20, 20);
    CGRect leftEyeRectCoverFrame = CGRectMake(center.x - 48, center.y - 48, 40, 20);
    CGRect rightEyeFrame = CGRectMake(center.x + 15, center.y - 35, 30, 30);
    CGRect rightEyeCircleCoverFrame = CGRectMake(center.x + 40, center.y - 52, 20, 20);
    CGRect rightEyeRectCoverFrame = CGRectMake(center.x + 8, center.y - 48, 40, 20);
    CAAnimation *gradientAnimation = [AnimationFactory gradientAnimationWithBadGradient:badGradient
                                                                            ughGradient:ughGradient
                                                                             okGradient:okGradient
                                                                           goodGradient:goodGradient];
    [self configureEyeWithFrame:leftEyeFrame
               circleCoverFrame:leftEyeCircleCoverFrame
                 rectCoverFrame:leftEyeRectCoverFrame
                animationOffset:10
           rectCoverAngleDegree:15
              gradientAnimation:gradientAnimation
                backgroundColor:backgroundColor];
    [self configureEyeWithFrame:rightEyeFrame
               circleCoverFrame:rightEyeCircleCoverFrame
                 rectCoverFrame:rightEyeRectCoverFrame
                animationOffset:-10
           rectCoverAngleDegree:-15
              gradientAnimation:gradientAnimation
                backgroundColor:backgroundColor];
}

- (void)configureEyeWithFrame:(CGRect)frame
             circleCoverFrame:(CGRect)circleCoverFrame
               rectCoverFrame:(CGRect)rectCoverFrame
              animationOffset:(CGFloat)offset
         rectCoverAngleDegree:(CGFloat)rectCoverAngleDegree
            gradientAnimation:(CAAnimation *)gradientAnimation
              backgroundColor:(UIColor *)backgroundColor {
    CAAnimation *eyeCircleCoverAnimation = [AnimationFactory eyeCircleCoverAnimationWithOffset:offset];
    CAAnimation *eyeRectCoverAnimation = [AnimationFactory eyeRectCoverAnimationWithOffset:offset];

    CALayer *eyeLayer = [LayerFactory eyeLayerWithSize:frame.size];
    CALayer *gradientLayer = [LayerFactory gradientLayerWithMask:eyeLayer frame:frame];
    CALayer *eyeCircleCoverLayer = [LayerFactory eyeCircleCoverLayerWithFrame:circleCoverFrame
                                                              backgroundColor:backgroundColor];
    CALayer *eyeRectCoverLayer = [LayerFactory eyeRectCoverLayerWithFrame:rectCoverFrame
                                                              angleDegree:rectCoverAngleDegree
                                                          backgroundColor:backgroundColor];

    [self.layer addSublayer:gradientLayer];
    [self.layer addSublayer:eyeCircleCoverLayer];
    [self.layer addSublayer:eyeRectCoverLayer];

    [gradientLayer addAnimation:gradientAnimation forKey:@"animateEyeGradient"];
    [eyeCircleCoverLayer addAnimation:eyeCircleCoverAnimation forKey:@"animateEyeCircleCover"];
    [eyeRectCoverLayer addAnimation:eyeRectCoverAnimation forKey:@"animateEyeRectCover"];

    gradientLayer.speed = 0;
    eyeCircleCoverLayer.speed = 0;
    eyeRectCoverLayer.speed = 0;

    [layers addObjectsFromArray:@[gradientLayer, eyeCircleCoverLayer, eyeRectCoverLayer]];
}

- (void)configureFaceWithBadGradient:(Gradient *)badGradient
                         ughGradient:(Gradient *)ughGradient
                          okGradient:(Gradient *)okGradient
                        goodGradient:(Gradient *)goodGradient {
    CAAnimation *gradientAnimation = [AnimationFactory gradientAnimationWithBadGradient:badGradient
                                                                            ughGradient:ughGradient
                                                                             okGradient:okGradient
                                                                           goodGradient:goodGradient];

    CALayer *faceLayer = [LayerFactory faceLayerWithSize:self.bounds.size];
    CALayer *gradientLayer = [LayerFactory gradientLayerWithMask:faceLayer frame:self.bounds];

    [self.layer addSublayer:gradientLayer];

    [gradientLayer addAnimation:gradientAnimation forKey:@"animateFaceGradient"];

    gradientLayer.speed = 0;

    [layers addObjectsFromArray:@[gradientLayer]];
}

- (void)configureWithBackgroundColor:(UIColor *)backgroundColor
                         badGradient:(Gradient *)badGradient
                         ughGradient:(Gradient *)ughGradient
                          okGradient:(Gradient *)okGradient
                        goodGradient:(Gradient *)goodGradient {
    self.backgroundColor = backgroundColor;
    layers = [NSMutableArray new];
    [self configureMouthWithBadGradient:badGradient ughGradient:ughGradient okGradient:okGradient goodGradient:goodGradient];
    [self configureEyesWithBackgroundColor:backgroundColor
                               badGradient:badGradient
                               ughGradient:ughGradient
                                okGradient:okGradient
                              goodGradient:goodGradient];
    [self configureFaceWithBadGradient:badGradient ughGradient:ughGradient okGradient:okGradient goodGradient:goodGradient];
}

- (void)updateLayers:(CGFloat)progress {
    for (CALayer *layer in layers) {
        layer.timeOffset = progress;
    }
}

@end

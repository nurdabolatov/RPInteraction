//
//  DescriptionView.m
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/12/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import "DescriptionView.h"
#import "Constants.h"
#import "UIColor+Utils.h"
#import "UIFont+Utils.h"
#import "AnimationFactory.h"
#import "LayerFactory.h"

@implementation DescriptionView {
    NSMutableArray *layers;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        layers = [NSMutableArray new];
    }
    return self;
}

- (void)configureLabelWithRate:(RPRate)rate title:(NSString *)title color:(UIColor *)color {
    UILabel *label = [UILabel new];
    label.frame = self.bounds;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color;
    [self addSubview:label];

    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if(screenHeight == 480 || screenHeight == 568) {
            label.font = [UIFont heavyFontOfSize:32];
        } else {
            label.font = [UIFont heavyFontOfSize:48];
        }
    }

    CGFloat offset = [[UIScreen mainScreen] bounds].size.width / 3;
    CAAnimation *descriptionAnimation = [AnimationFactory descriptionAnimationWithRate:rate
                                                                                offset:offset];
    [label.layer addAnimation:descriptionAnimation forKey:@"animateLabel"];
    label.layer.speed = 0;
    [layers addObjectsFromArray:@[label.layer]];
}

- (void)updateLayers:(CGFloat)progress {
    for (CALayer *layer in layers) {
        layer.timeOffset = progress;
    }
}

@end

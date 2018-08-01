//
//  Gradient.m
//  RPInteraction
//
//  Created by Nurdaulet Bolatov on 7/31/18.
//

#import "Gradient.h"

@implementation Gradient

- (instancetype)initWithStartGradientColor:(UIColor *)startGradientColor
                          endGradientColor:(UIColor *)endGradientColor {
    if (self = [super init]) {
        _startGradientColor = startGradientColor;
        _endGradientColor = endGradientColor;
    }
    return self;
}

@end

//
//  Gradient.h
//  RPInteraction
//
//  Created by Nurdaulet Bolatov on 7/31/18.
//

#import <Foundation/Foundation.h>

@interface Gradient : NSObject

- (instancetype)initWithStartGradientColor:(UIColor *)startGradientColor
                          endGradientColor:(UIColor *)endGradientColor;

@property (strong, nonatomic) UIColor *startGradientColor;
@property (strong, nonatomic) UIColor *endGradientColor;

@end

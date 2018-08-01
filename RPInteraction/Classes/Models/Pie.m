//
//  Pie.m
//  RPInteraction
//
//  Created by Nurdaulet Bolatov on 7/31/18.
//

#import "Pie.h"

@implementation Pie

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     gradient:(Gradient *)gradient {
    if (self = [super init]) {
        _title = title;
        _titleColor = titleColor;
        _gradient = gradient;
    }
    return self;
}

@end

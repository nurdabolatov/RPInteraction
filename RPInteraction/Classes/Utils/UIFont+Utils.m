//
//  UIFont+Utils.m
//  RPInteraction
//
//  Created by Nurdaulet Bolatov on 7/30/18.
//

#import "UIFont+Utils.h"

@implementation UIFont (Utils)

+ (UIFont *)heavyFontOfSize:(CGFloat)fontSize {
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:fontSize weight:UIFontWeightHeavy];
    }
    return [UIFont systemFontOfSize:fontSize];
}

@end

//
//  Pie.h
//  RPInteraction
//
//  Created by Nurdaulet Bolatov on 7/31/18.
//

#import <Foundation/Foundation.h>
#import "Gradient.h"

@interface Pie : NSObject

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     gradient:(Gradient *)gradient;

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UIColor *titleColor;
@property (strong, nonatomic) Gradient *gradient;

@end

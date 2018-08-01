//
//  UIColor+Utils.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/9/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)

+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (UIColor *)colorWithHexValue:(NSInteger)hex;

@end

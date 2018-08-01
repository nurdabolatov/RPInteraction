//
//  DescriptionView.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/12/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPRate.h"

@interface DescriptionView : UIView

- (void)configureLabelWithRate:(RPRate)rate title:(NSString *)title color:(UIColor *)color;
- (void)updateLayers:(CGFloat)progress;

@end

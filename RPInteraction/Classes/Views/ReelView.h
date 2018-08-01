//
//  ReelView.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/9/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pie.h"

@interface ReelView : UIView

- (void)configureWithBadPie:(Pie *)badPie
                     ughPie:(Pie *)ughPie
                      okPie:(Pie *)okPie
                    goodPie:(Pie *)goodPie;

@end

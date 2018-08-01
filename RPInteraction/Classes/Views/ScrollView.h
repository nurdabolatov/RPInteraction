//
//  ScrollView.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/13/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollViewDelegate

- (void)scrollViewDidChangeProgress:(CGFloat)progress;

@end

@interface ScrollView : UIView

@property (weak) id <ScrollViewDelegate> delegate;

- (void)configure;

@end

//
//  RPViewController.h
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 3/30/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPRate.h"

@interface RPViewController : UIViewController {
    void(^_confirmHandler)(RPRate rate);
    void(^_cancelHandler)(void);
}

@property (copy, nonatomic) NSString *rateTitle;
@property (copy, nonatomic) NSString *badTitle;
@property (copy, nonatomic) NSString *ughTitle;
@property (copy, nonatomic) NSString *okTitle;
@property (copy, nonatomic) NSString *goodTitle;
@property (copy, nonatomic) NSString *confirmTitle;

@property (strong, nonatomic) UIFont *rateTitleFont;
@property (strong, nonatomic) UIFont *confirmTitleFont;

@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIColor *closeIconColor;

@property (strong, nonatomic) UIColor *rateTitleColor;
@property (strong, nonatomic) UIColor *reelTitleColor;
@property (strong, nonatomic) UIColor *confirmTitleColor;

@property (strong, nonatomic) UIColor *badTitleColor;
@property (strong, nonatomic) UIColor *ughTitleColor;
@property (strong, nonatomic) UIColor *okTitleColor;
@property (strong, nonatomic) UIColor *goodTitleColor;

@property (strong, nonatomic) UIColor *badStartGradientColor;
@property (strong, nonatomic) UIColor *badEndGradientColor;
@property (strong, nonatomic) UIColor *ughStartGradientColor;
@property (strong, nonatomic) UIColor *ughEndGradientColor;
@property (strong, nonatomic) UIColor *okStartGradientColor;
@property (strong, nonatomic) UIColor *okEndGradientColor;
@property (strong, nonatomic) UIColor *goodStartGradientColor;
@property (strong, nonatomic) UIColor *goodEndGradientColor;

- (void)onConfirmHandler:(void(^)(RPRate rate))confirmHandler;
- (void)onCancelHandler:(void(^)(void))cancelHandler;

@end

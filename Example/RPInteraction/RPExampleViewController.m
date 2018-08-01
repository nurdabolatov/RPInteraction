//
//  RPExampleViewController.m
//  RPInteraction_Example
//
//  Created by Nurdaulet Bolatov on 7/31/18.
//  Copyright © 2018 nbolatov. All rights reserved.
//

#import "RPExampleViewController.h"
@import RPInteraction;

@interface RPExampleViewController ()

@end

@implementation RPExampleViewController {
    UILabel *titleLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    titleLabel = [UILabel new];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Review Page Interaction";
    titleLabel.frame = CGRectMake(0, 0, 200, 50);
    titleLabel.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    [self.view addSubview:titleLabel];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    [button setTitle:@"Show" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)show {
    RPViewController *vc = [RPViewController new];
    [vc onConfirmHandler:^(RPRate rate) {
        switch (rate) {
            case RPRateBad:
                titleLabel.text = @"BAD";
                break;
            case RPRateUgh:
                titleLabel.text = @"UGH";
                break;
            case RPRateOk:
                titleLabel.text = @"OK";
                break;
            case RPRateGood:
                titleLabel.text = @"GOOD";
                break;
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [vc onCancelHandler:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [self presentViewController:vc animated:YES completion:nil];
}

@end

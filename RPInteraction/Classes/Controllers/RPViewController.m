//
//  RPViewController.m
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 3/30/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import "RPViewController.h"
#import "FaceView.h"
#import "ReelView.h"
#import "ConfirmView.h"
#import "DescriptionView.h"
#import "Constants.h"
#import "UIColor+Utils.h"
#import "ScrollView.h"
#import "Pie.h"

@interface RPViewController () <ScrollViewDelegate> {
    CGFloat currentProgress;
    CGFloat screenWidth;
    Gradient *badGradient;
    Gradient *ughGradient;
    Gradient *okGradient;
    Gradient *goodGradient;
    Boolean isViewDidAppear;
}

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) ReelView *reelView;
@property (strong, nonatomic) ScrollView *scrollView;
@property (strong, nonatomic) FaceView *faceView;
@property (strong, nonatomic) ConfirmView *confirmView;
@property (strong, nonatomic) DescriptionView *descriptionView;

@end

@implementation RPViewController

- (instancetype)init {
    if (self = [super init]) {
        _rateTitle = @"How was your experience with us?";
        _badTitle = @"BAD";
        _ughTitle = @"UGH";
        _okTitle = @"OK";
        _goodTitle = @"GOOD";
        _confirmTitle = @"SUBMIT";

        _rateTitleFont = [UIFont systemFontOfSize:24];
        _confirmTitleFont = [UIFont systemFontOfSize:24];

        _backgroundColor = UIColor.whiteColor;
        _closeIconColor = [UIColor colorWithHexString:MAIN_TITLE];

        _rateTitleColor = [UIColor colorWithHexString:MAIN_TITLE];
        _reelTitleColor = UIColor.whiteColor;
        _confirmTitleColor = UIColor.whiteColor;

        _badTitleColor = [UIColor colorWithHexString:BAD_TITLE];
        _ughTitleColor = [UIColor colorWithHexString:UGH_TITLE];
        _okTitleColor = [UIColor colorWithHexString:OK_TITLE];
        _goodTitleColor = [UIColor colorWithHexString:GOOD_TITLE];

        _badStartGradientColor = [UIColor colorWithHexString:BAD_START];
        _badEndGradientColor = [UIColor colorWithHexString:BAD_END];
        _ughStartGradientColor = [UIColor colorWithHexString:UGH_START];
        _ughEndGradientColor = [UIColor colorWithHexString:UGH_END];
        _okStartGradientColor = [UIColor colorWithHexString:OK_START];
        _okEndGradientColor = [UIColor colorWithHexString:OK_END];
        _goodStartGradientColor = [UIColor colorWithHexString:GOOD_START];
        _goodEndGradientColor = [UIColor colorWithHexString:GOOD_END];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = _backgroundColor;
    screenWidth = [[UIScreen mainScreen] bounds].size.width;

    badGradient = [[Gradient alloc] initWithStartGradientColor:_badStartGradientColor
                                              endGradientColor:_badEndGradientColor];
    ughGradient = [[Gradient alloc] initWithStartGradientColor:_ughStartGradientColor
                                              endGradientColor:_ughEndGradientColor];
    okGradient = [[Gradient alloc] initWithStartGradientColor:_okStartGradientColor
                                             endGradientColor:_okEndGradientColor];
    goodGradient = [[Gradient alloc] initWithStartGradientColor:_goodStartGradientColor
                                               endGradientColor:_goodEndGradientColor];

    [self configureTitle];
    [self configureFace];
    [self configureReel];
    [self configureDescription];
    [self configureConfirmation];
    [self configureCancel];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    isViewDidAppear = YES;
}

- (void)configureReel {
    CGFloat reelWidth = screenWidth + 300;
    CGRect reelViewRect = CGRectMake(0, 0, reelWidth, reelWidth);
    _reelView = [[ReelView alloc] initWithFrame:reelViewRect];
    _reelView.center = CGPointMake(self.view.center.x, self.view.bounds.size.height + 70);
    [self.view addSubview:_reelView];
    Pie *badPie = [[Pie alloc] initWithTitle:_badTitle titleColor:_reelTitleColor gradient:badGradient];
    Pie *ughPie = [[Pie alloc] initWithTitle:_ughTitle titleColor:_reelTitleColor gradient:ughGradient];
    Pie *okPie = [[Pie alloc] initWithTitle:_okTitle titleColor:_reelTitleColor gradient:okGradient];
    Pie *goodPie = [[Pie alloc] initWithTitle:_goodTitle titleColor:_reelTitleColor gradient:goodGradient];
    [_reelView configureWithBadPie:badPie ughPie:ughPie okPie:okPie goodPie:goodPie];

    _scrollView = [[ScrollView alloc] initWithFrame:_reelView.frame];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    [_scrollView configure];
}

- (void)configureTitle {
    _titleLabel = [UILabel new];
    CGFloat y = 30;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if(screenHeight == 480 || screenHeight == 568) {
            y = 20;
        } else if (screenHeight == 812) {
            y = 60;
        }
    }
    _titleLabel.frame = CGRectMake(50, y, screenWidth - 100, 60);
    _titleLabel.font = _rateTitleFont;
    _titleLabel.numberOfLines = 2;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = _rateTitleColor;
    _titleLabel.text = _rateTitle;
    [self.view addSubview:_titleLabel];
}

- (void)configureFace {
    CGRect faceViewRect = CGRectMake(0, 0, 180, 180);
    CGFloat titleLabelMaxY = _titleLabel.frame.origin.y + _titleLabel.frame.size.height;
    _faceView = [[FaceView alloc] initWithFrame:faceViewRect];
    _faceView.center = CGPointMake(self.view.center.x, (self.view.center.y + titleLabelMaxY) / 2);
    _faceView.backgroundColor = UIColor.grayColor;
    [self.view addSubview:_faceView];
    [_faceView configureWithBackgroundColor:_backgroundColor
                                badGradient:badGradient
                                ughGradient:ughGradient
                                 okGradient:okGradient
                               goodGradient:goodGradient];
}

- (void)configureDescription {
    CGRect descriptionViewRect = CGRectMake(0, 0, 180, 50);
    CGFloat faceViewMaxY = _faceView.frame.origin.y + _faceView.frame.size.height;
    _descriptionView = [[DescriptionView alloc] initWithFrame:descriptionViewRect];
    _descriptionView.center = CGPointMake(self.view.center.x, (faceViewMaxY + _reelView.frame.origin.y) / 2);
    [self.view addSubview:_descriptionView];
    [_descriptionView configureLabelWithRate:RPRateBad title:_badTitle color:_badTitleColor];
    [_descriptionView configureLabelWithRate:RPRateUgh title:_ughTitle color:_ughTitleColor];
    [_descriptionView configureLabelWithRate:RPRateOk title:_okTitle color:_okTitleColor];
    [_descriptionView configureLabelWithRate:RPRateGood title:_goodTitle color:_goodTitleColor];
}

- (void)configureConfirmation {
    CGFloat confirmWidth = _reelView.frame.size.width * 0.64;
    CGRect confirmViewRect = CGRectMake(0, 0, confirmWidth, confirmWidth);
    _confirmView = [[ConfirmView alloc] initWithFrame:confirmViewRect];
    _confirmView.center = CGPointMake(self.view.center.x, self.view.bounds.size.height + 70);
    _confirmView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:_confirmView];
    [_confirmView configureWithBackgroundColor:_backgroundColor
                                         title:_confirmTitle
                                   badGradient:badGradient
                                   ughGradient:ughGradient
                                    okGradient:okGradient
                                  goodGradient:goodGradient];
    _confirmView.button.titleLabel.font = _confirmTitleFont;
    [_confirmView.button addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureCancel {
    NSString *imageName = @"close.png";
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSBundle *resources = [NSBundle bundleWithURL:[bundle URLForResource:@"RPInteraction" withExtension:@"bundle"]];
    UIImage *closeIcon = [UIImage imageNamed:imageName];
    if (closeIcon == nil) closeIcon = [UIImage imageNamed:imageName inBundle:resources compatibleWithTraitCollection:nil];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(screenWidth - 38, _titleLabel.frame.origin.y, 26, 60);
    button.tintColor = _closeIconColor;
    [button setImage:closeIcon forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)onConfirmHandler:(void(^)(RPRate rate))confirmHandler {
    _confirmHandler = [confirmHandler copy];
}

- (void)onCancelHandler:(void(^)(void))cancelHandler {
    _cancelHandler = [cancelHandler copy];
}

- (void)confirm {
    RPRate rate = RPRateGood;
    if ((-0.1 < currentProgress && currentProgress < 0.1) || (0.4 < currentProgress && currentProgress < 0.6)
        || (0.9 < currentProgress)) {
        rate = RPRateBad;
    } else if ((0.1 < currentProgress && currentProgress < 0.2) || (0.6 < currentProgress && currentProgress < 0.7)) {
        rate = RPRateUgh;
    } else if ((0.2 < currentProgress && currentProgress < 0.3) || (0.7 < currentProgress && currentProgress < 0.8)) {
        rate = RPRateOk;
    }
    if (_confirmHandler) {
        __weak RPViewController *weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            RPViewController *ref = weakSelf;
            if (ref == nil) return;
            ref->_confirmHandler(rate);
            ref->_confirmHandler = nil;
        });
    }
}

- (void)cancel {
    if (_cancelHandler) {
        __weak RPViewController *weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            RPViewController *ref = weakSelf;
            if (ref == nil) return;
            ref->_cancelHandler();
            ref->_cancelHandler = nil;
        });
    }
}

#pragma mark ScrollViewDelegate

- (void)scrollViewDidChangeProgress:(CGFloat)progress {
    if (!isViewDidAppear) return;
    CGFloat angle = -2 * M_PI * progress;
    CGFloat newProgress = progress < 0 ? 1 + progress : progress;
    currentProgress = newProgress;
    __weak RPViewController *weakSelf = self;
    dispatch_block_t updateLayers = ^{
        weakSelf.reelView.transform = CGAffineTransformMakeRotation(angle);
        [weakSelf.faceView updateLayers:newProgress];
        [weakSelf.confirmView updateLayers:newProgress];
        [weakSelf.descriptionView updateLayers:newProgress];
    };
    if ([NSThread isMainThread]) {
        updateLayers();
    } else {
        dispatch_sync(dispatch_get_main_queue(), updateLayers);
    }
}

@end

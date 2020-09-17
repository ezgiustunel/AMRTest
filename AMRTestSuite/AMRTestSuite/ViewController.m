//
//  ViewController.m
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 16.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *bannerAdView;

@end

@implementation ViewController

#pragma mark - View Lifecycles

- (void)viewDidLoad {
    [super viewDidLoad];
    _mpuBanner = [AMRBanner bannerForZoneId:@"b4009772-de04-42c4-bbaa-c18da9e4a1ab"];
    _mpuBanner.delegate = self;
    _mpuBanner.bannerWidth = [UIScreen mainScreen].bounds.size.width;
    [_mpuBanner loadBanner];
    
}

#pragma mark - <AMRBannerDelegate> Methods

- (void)didReceiveBanner:(AMRBanner *)banner {
    [_bannerAdView addSubview:banner.bannerView];
    _bannerAdView = _mpuBanner.bannerView;
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
}

- (void)didClickBanner:(AMRBanner *)banner {
    NSLog(@"Banner clicked.");
}

@end

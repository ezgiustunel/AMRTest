//
//  ViewController.m
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 16.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import "BannerViewController.h"

@interface BannerViewController ()
@property (weak, nonatomic) IBOutlet UIView *bannerAdView;
@property(nonatomic, strong) AMRBanner *mpuBanner;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButtonItem;
@property (weak, nonatomic) IBOutlet UIButton *BTNReload;
@end

@implementation BannerViewController {
    AlertSetup *alertSetup;
}

#pragma mark - View Lifecycles

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    alertSetup = [AlertSetup new];
    
    _activityIndicatorView.hidden = NO;
    [_activityIndicatorView startAnimating];
    
    [self bannerSetup];
}

#pragma mark - Banner Setup

- (void)bannerSetup {
    _mpuBanner = [AMRBanner bannerForZoneId:@"b4009772-de04-42c4-bbaa-c18da9e4a1ab"];
    _mpuBanner.delegate = self;
    _mpuBanner.bannerWidth = [UIScreen mainScreen].bounds.size.width;
    [_mpuBanner loadBanner];
}

#pragma mark - <AMRBannerDelegate> Methods

- (void)didReceiveBanner:(AMRBanner *)banner {
    _activityIndicatorView.hidden = YES;

    self.navigationItem.rightBarButtonItem.enabled = YES;

    [_bannerAdView addSubview:banner.bannerView];
    _bannerAdView = _mpuBanner.bannerView;
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
    
    UIAlertController *alert = [alertSetup informativeAlertMessage:@"This is an erros message!"];
    [self presentViewController: alert animated: true completion: nil];
}

- (void)didClickBanner:(AMRBanner *)banner {
    NSLog(@"Banner clicked.");
}

#pragma mark - IBActions

- (IBAction)reloadAd:(id)sender {
    _activityIndicatorView.hidden = NO;
    [_activityIndicatorView startAnimating];
    
    [self bannerSetup];
}

@end

//
//  InterstitialViewController.m
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 17.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import "InterstitialViewController.h"

@interface InterstitialViewController ()

@end

@implementation InterstitialViewController

#pragma mark - View Lifecycles

- (void)viewDidLoad {
    [super viewDidLoad];
    _fullScreen = [AMRInterstitial interstitialForZoneId:@"39f74377-5682-436a-9338-9d1c4df410bd"];
    _fullScreen.delegate = self;
    [_fullScreen loadInterstitial];
}

#pragma mark - <AMRInterstitialDelegate> Methods

- (void)didReceiveInterstitial:(AMRInterstitial *)interstitial {
    [interstitial showFromViewController:self];
}

- (void)didFailToReceiveInterstitial:(AMRInterstitial *)interstitial error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
}

- (void)didShowInterstitial:(AMRInterstitial *)interstitial {}

- (void)didFailToShowInterstitial:(AMRInterstitial *)interstitial error:(AMRError *)error {}

- (void)didClickInterstitial:(AMRInterstitial *)interstitial {}

- (void)didDismissInterstitial:(AMRInterstitial *)interstitial {}

@end

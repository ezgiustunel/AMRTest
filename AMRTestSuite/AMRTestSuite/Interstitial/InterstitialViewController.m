//
//  InterstitialViewController.m
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 17.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import "InterstitialViewController.h"

@interface InterstitialViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIButton *BTNReload;
@property(nonatomic, strong) AMRInterstitial *fullScreen;
@end

@implementation InterstitialViewController {
    AlertSetup *alertSetup;
}

#pragma mark - View Lifecycles

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    alertSetup = [AlertSetup new];
    
    _activityIndicatorView.hidden = NO;
    [_activityIndicatorView startAnimating];
    
    [self interstitialSetup];
}

#pragma mark - Interstitial Setup

- (void)interstitialSetup {
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
    UIAlertController *alert = [alertSetup informativeAlertMessage:@"Ad could not be loaded!"];
    
    _activityIndicatorView.hidden = YES;
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    [self presentViewController: alert animated: true completion: nil];
}

- (void)didShowInterstitial:(AMRInterstitial *)interstitial {
    _activityIndicatorView.hidden = YES;
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)didFailToShowInterstitial:(AMRInterstitial *)interstitial error:(AMRError *)error {}

- (void)didClickInterstitial:(AMRInterstitial *)interstitial {}

- (void)didDismissInterstitial:(AMRInterstitial *)interstitial {}

#pragma mark - IBActions

- (IBAction)reloadAd:(id)sender {
    _activityIndicatorView.hidden = NO;
    [_activityIndicatorView startAnimating];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;

    [self interstitialSetup];
}

@end

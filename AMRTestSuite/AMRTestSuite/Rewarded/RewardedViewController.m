//
//  RewardedViewController.m
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 17.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import "RewardedViewController.h"

@interface RewardedViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIButton *BTNReload;
@property(nonatomic, strong) AMRRewardedVideo *rewardedVideo;
@end

@implementation RewardedViewController {
    AlertSetup *alertSetup;
}

#pragma mark - View Lifecycles

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    alertSetup = [AlertSetup new];

    _activityIndicatorView.hidden = NO;
    [_activityIndicatorView startAnimating];
    [self rewardedSetup];
}

#pragma mark - Rewarded Setup

- (void)rewardedSetup {
    _rewardedVideo = [AMRRewardedVideo rewardedVideoForZoneId:@"2bdefd44-5269-4cbc-b93a-373b74a2f067"];
    _rewardedVideo.delegate = self;
    [_rewardedVideo loadRewardedVideo];
}

#pragma mark - <AMRRewardedVideoDelegate> Methods

- (void)didReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    _activityIndicatorView.hidden = YES;
    
    self.navigationItem.rightBarButtonItem.enabled = YES;

    [rewardedVideo showFromViewController:self];
}

- (void)didFailToReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
    UIAlertController *alert = [alertSetup informativeAlertMessage:@"Ad could not be loaded!"];
    
    _activityIndicatorView.hidden = YES;
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    [self presentViewController: alert animated: true completion: nil];
}

- (void)didShowRewardedVideo:(AMRRewardedVideo *)rewardedVideo {}

- (void)didFailToShowRewardedVideo:(AMRRewardedVideo *)rewardedVideo error:(AMRError *)error {}

- (void)didClickRewardedVideo:(AMRRewardedVideo *)rewardedVideo {}

- (void)didCompleteRewardedVideo:(AMRRewardedVideo *)rewardedVideo {}

- (void)didDismissRewardedVideo:(AMRRewardedVideo *)rewardedVideo {}

#pragma mark - IBActions

- (IBAction)reloadAd:(id)sender {
    _activityIndicatorView.hidden = NO;
    [_activityIndicatorView startAnimating];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;

    [self rewardedSetup];
}

@end

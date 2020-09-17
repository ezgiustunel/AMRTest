//
//  RewardedViewController.h
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 17.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMRSDK/AMRSDK.h>

@interface RewardedViewController : UIViewController <AMRRewardedVideoDelegate>
@property(nonatomic, strong) AMRRewardedVideo *rewardedVideo;

@end


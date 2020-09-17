//
//  InterstitialViewController.h
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 17.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMRSDK/AMRSDK.h>

@interface InterstitialViewController : UIViewController <AMRInterstitialDelegate>
@property(nonatomic, strong) AMRInterstitial *fullScreen;

@end


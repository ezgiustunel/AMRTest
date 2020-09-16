//
//  ViewController.h
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 16.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMRSDK/AMRSDK.h>

@interface ViewController : UIViewController <AMRBannerDelegate>
@property(nonatomic, strong) AMRBanner *mpuBanner;


@end


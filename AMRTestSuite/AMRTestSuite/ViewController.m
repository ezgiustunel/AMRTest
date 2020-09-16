//
//  ViewController.m
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 16.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mpuBanner = [AMRBanner bannerForZoneId:@"b4009772-de04-42c4-bbaa-c18da9e4a1ab"];
    _mpuBanner.delegate = self;
    _mpuBanner.bannerWidth = [UIScreen mainScreen].bounds.size.width;
    
    [_mpuBanner loadBanner];


}

- (void)didReceiveBanner:(AMRBanner *)banner {
    [self.view addSubview:banner.bannerView];
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
}

- (void)didClickBanner:(AMRBanner *)banner {
    NSLog(@"Banner clicked.");
}


@end

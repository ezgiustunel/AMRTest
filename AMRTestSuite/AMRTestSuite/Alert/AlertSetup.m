//
//  AdViewSetup.m
//  AMRTestSuite
//
//  Created by Ezgi Ustunel on 17.09.2020.
//  Copyright © 2020 Ezgi Ustunel. All rights reserved.
//

#import "AlertSetup.h"

@implementation AlertSetup

- (UIAlertController *)informativeAlertMessage: (NSString *)msg {
    UIAlertController *alertvc = [UIAlertController alertControllerWithTitle: @"Error"
                                 message: msg preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle: @"Dismiss"
                            style: UIAlertActionStyleDefault handler: ^(UIAlertAction *_Nonnull action) {
                              NSLog(@"Dismiss Tapped");
                            }];
    [alertvc addAction: action];
    
    return alertvc;
}

@end

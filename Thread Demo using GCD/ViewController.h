//
//  ViewController.h
//  Thread Demo using GCD
//
//  Created by Student-002 on 17/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong, nonatomic) IBOutlet UIImageView *img1;

@property (strong, nonatomic) IBOutlet UIImageView *img2;
- (IBAction)download:(id)sender;

@property (nonatomic,retain)dispatch_queue_t queue;

@end


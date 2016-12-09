//
//  ViewController.m
//  Thread Demo using GCD
//
//  Created by Student-002 on 17/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    Task to perform same time use
    _queue=dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
//        Task to perform 1 after other i.e., serialy
    _queue=dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)download:(id)sender {
    
    
    
    NSString *imgpath1=@"http://keenthemes.com/preview/metronic/theme/assets/global/plugins/jcrop/demos/demo_files/image1.jpg";
    NSString *imgpath2=@"http://i.amz.mshcdn.com/Pp-86XPbUlVRkvX2sj1JNKduDRc=/fit-in/1200x9600/https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com%2Fuploads%2Fcard%2Fimage%2F176275%2FGettyImages-587925244.jpg";
    [_indicator startAnimating];
    
    
    dispatch_async(_queue, ^{
        
        NSURL *url=[NSURL URLWithString:imgpath1];
        NSData *data1=[NSData dataWithContentsOfURL:url];
        UIImage *image1=[UIImage imageWithData:data1];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _img1.image=image1;
        });
    });
    dispatch_async(_queue, ^{
        
        NSURL *url2=[NSURL URLWithString:imgpath2];
        NSData *data2=[NSData dataWithContentsOfURL:url2];
        UIImage *image2=[UIImage imageWithData:data2];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _img2.image=image2;
            [_indicator stopAnimating];
        });
    });
    
    
    
    
    
//    // for global queue
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        NSURL *url=[NSURL URLWithString:imgpath1];
//        NSData *data1=[NSData dataWithContentsOfURL:url];
//        UIImage *image1=[UIImage imageWithData:data1];
//        _img1.image=image1;
//        
//
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//        NSURL *url2=[NSURL URLWithString:imgpath2];
//        NSData *data2=[NSData dataWithContentsOfURL:url2];
//        UIImage *image2=[UIImage imageWithData:data2];
//        _img2.image=image2;
//        [_indicator stopAnimating];
//    });
    
    
    
    
    
    
}
@end

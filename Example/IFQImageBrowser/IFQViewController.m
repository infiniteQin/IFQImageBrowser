//
//  IFQViewController.m
//  IFQImageBrowser
//
//  Created by lingyou on 01/05/2017.
//  Copyright (c) 2017 lingyou. All rights reserved.
//

#import "IFQViewController.h"
#import <IFQImageBrowser/IFQImageBrowserViewController.h>
#import "IFQCustomWebImageLoader.h"

@interface IFQViewController ()

@end

@implementation IFQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    UIView *testView = [UIView new];
//    testView.backgroundColor = [UIColor yellowColor];
//    testView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:testView];
//
//    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:testView
//                                                                     attribute:NSLayoutAttributeTop
//                                                                     relatedBy:NSLayoutRelationEqual
//                                                                        toItem:self.view
//                                                                     attribute:NSLayoutAttributeTop
//                                                                    multiplier:1.0
//                                                                      constant:0];
//
//    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:testView
//                                                                      attribute:NSLayoutAttributeLeft
//                                                                      relatedBy:NSLayoutRelationEqual
//                                                                         toItem:self.view
//                                                                      attribute:NSLayoutAttributeLeft
//                                                                     multiplier:1.0
//                                                                       constant:0];
//    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:testView
//                                                                       attribute:NSLayoutAttributeRight
//                                                                       relatedBy:NSLayoutRelationEqual
//                                                                          toItem:self.view
//                                                                       attribute:NSLayoutAttributeRight
//                                                                      multiplier:1.0
//                                                                        constant:0];
//    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:testView
//                                                                        attribute:NSLayoutAttributeBottom
//                                                                        relatedBy:NSLayoutRelationEqual
//                                                                           toItem:self.view
//                                                                        attribute:NSLayoutAttributeBottom
//                                                                       multiplier:1.0
//                                                                         constant:0 ];
//
//    [self.view addConstraint:top];
//    [self.view addConstraint:left];
//    [self.view addConstraint:right];
//    [self.view addConstraint:bottom];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)browserImages:(id)sender {
    IFQImageBrowserViewController *imageBrowserVC =[[IFQImageBrowserViewController alloc] init];
    imageBrowserVC.images = @[@"http://pic44.nipic.com/20140717/12432466_121957328000_2.jpg",
                              @"http://pic44.nipic.com/20140717/12432466_121957328000_2.jpg",
                              @"http://pic44.nipic.com/20140717/12432466_121957328000_2.jpg"];
//    imageBrowserVC.webImageLoader =  [IFQCustomWebImageLoader sharedInstance];
    [self presentViewController:imageBrowserVC animated:YES completion:NULL];
}



@end

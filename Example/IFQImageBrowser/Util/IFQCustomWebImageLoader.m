//
//  IFQCustomWebImageLoader.m
//  IFQImageBrowser
//
//  Created by infiq on 2017/1/5.
//  Copyright © 2017年 lingyou. All rights reserved.
//

#import "IFQCustomWebImageLoader.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation IFQCustomWebImageLoader

+ (instancetype)sharedInstance {
    static IFQCustomWebImageLoader *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IFQCustomWebImageLoader alloc] init];
    });
    return instance;
}

- (void)cancelCurrentImageLoad:(UIImageView*)imageView {
    [imageView sd_cancelCurrentImageLoad];
}

- (void)imageView:(UIImageView*)imageView loadWebImage:(NSString*)url placeholderImage:(UIImage*)image {
    NSURL *imgURL = [NSURL URLWithString:url];
    [imageView sd_setImageWithURL:imgURL placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

    }];
}

@end

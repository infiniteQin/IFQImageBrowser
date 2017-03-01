//
//  IFQWebImageLoader.m
//  Pods
//
//  Created by infiq on 2017/1/7.
//
//

#import "IFQWebImageLoader.h"
#import <SDWebImage/UIView+WebCacheOperation.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation IFQWebImageLoader

+ (instancetype)imageLoader {
    IFQWebImageLoader *imageLoader = [[self alloc] init];
    return imageLoader;
}

- (void)cancelCurrentImageLoad:(UIImageView*)imageView {
    [imageView sd_cancelImageLoadOperationWithKey:NSStringFromClass([UIImageView class])];
}

- (void)imageView:(UIImageView*)imageView loadWebImage:(NSString*)url placeholderImage:(UIImage*)image {
    NSURL *imgURL = [NSURL URLWithString:url];
    [imageView sd_setImageWithURL:imgURL placeholderImage:image];
}

@end

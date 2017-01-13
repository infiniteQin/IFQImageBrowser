//
//  IFQImageViewWebImageLoadProtocol.h
//  Pods
//
//  Created by infiq on 2017/1/5.
//
//

#import <UIKit/UIKit.h>

@protocol IFQImageViewWebImageLoadProtocol <NSObject>


@required

- (void)cancelCurrentImageLoad:(UIImageView*)imageView;
- (void)imageView:(UIImageView*)imageView loadWebImage:(NSString*)url placeholderImage:(UIImage*)image;

@end

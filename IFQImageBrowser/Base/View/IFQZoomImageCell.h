//
//  IFQZoomImageCell.h
//  Pods
//
//  Created by infiq on 2017/1/5.
//
//

#import <UIKit/UIKit.h>

@interface IFQZoomImageCell : UICollectionViewCell

@property (nonatomic, copy) void (^didTapImageViewBlock)();

@property (nonatomic, strong, readonly) UIImageView *imageView;

- (void)setScale:(CGFloat)scale;

@end

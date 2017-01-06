//
//  IFQZoomImageView.m
//  Pods
//
//  Created by infiq on 2017/1/5.
//
//

#import "IFQZoomImageView.h"

@interface IFQZoomImageView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation IFQZoomImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpStyle];
        [self setUpSubviews];
        [self setUpLayout];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpStyle];
        [self setUpSubviews];
        [self setUpLayout];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpStyle];
    [self setUpSubviews];
    [self setUpLayout];
}

- (void)setUpStyle {
    self.delegate = self;
    self.maximumZoomScale = 3.0;
    self.minimumZoomScale = 1.0;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

- (void)setUpSubviews {
    [self addSubview:self.imageView];
}

- (void)setUpLayout {
    self.imageView.translatesAutoresizingMaskIntoConstraints = YES;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:0 ];

    [self addConstraints:@[topConstraint,leftConstraint,rightConstraint,bottomConstraint]];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat centerX = MAX(CGRectGetWidth(scrollView.frame),scrollView.contentSize.width)/2;
    CGFloat centerY = MAX(CGRectGetHeight(scrollView.frame),scrollView.contentSize.height)/2;
    self.imageView.center = CGPointMake(centerX, centerY);

}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end

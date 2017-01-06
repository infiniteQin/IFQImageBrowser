//
//  IFQZoomImageCell.m
//  Pods
//
//  Created by infiq on 2017/1/5.
//
//

#import "IFQZoomImageCell.h"
#import "IFQZoomImageView.h"

@interface IFQZoomImageCell ()
@property (nonatomic, strong) IFQZoomImageView *zoomImageView;
@end

@implementation IFQZoomImageCell

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
    self.backgroundColor = [UIColor blackColor];
}


- (void)setUpSubviews {
    [self.contentView addSubview:self.zoomImageView];
}

- (void)setUpLayout {
    self.zoomImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.zoomImageView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.zoomImageView
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.contentView
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.zoomImageView
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.contentView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.zoomImageView
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.contentView
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:0 ];

    [self.contentView addConstraints:@[topConstraint,leftConstraint,rightConstraint,bottomConstraint]];
}

- (UIImageView *)imageView {
    return self.zoomImageView.imageView;
}

- (IFQZoomImageView *)zoomImageView {
    if (!_zoomImageView) {
        _zoomImageView = [[IFQZoomImageView alloc] init];
        _zoomImageView.backgroundColor = [UIColor blackColor];
        _zoomImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scaleToDouble)];
        doubleTap.numberOfTapsRequired = 2;
        [_zoomImageView addGestureRecognizer:doubleTap];

        UITapGestureRecognizer *onceTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTapImageView)];
        onceTap.numberOfTapsRequired = 1;
        [_zoomImageView addGestureRecognizer:onceTap];

        [onceTap requireGestureRecognizerToFail:doubleTap];

    }
    return _zoomImageView;
}

- (void)scaleToDouble {
    if (self.zoomImageView.zoomScale != 1) {
        [self.zoomImageView setZoomScale:1 animated:YES];
    }else {
        [self.zoomImageView setZoomScale:2 animated:YES];
    }
}

- (void)oneTapImageView {
    if (self.didTapImageViewBlock) {
        self.didTapImageViewBlock();
    }
}

- (void)setScale:(CGFloat)scale {
    self.zoomImageView.zoomScale = scale;
}


@end

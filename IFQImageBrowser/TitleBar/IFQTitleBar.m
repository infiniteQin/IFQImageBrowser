//
//  IFQTitleBar.m
//  Pods
//
//  Created by infiq on 2017/1/5.
//
//

#import "IFQTitleBar.h"

@interface IFQTitleBar ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation IFQTitleBar

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
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
}


- (void)setUpSubviews {
    [self addSubview:self.titleLabel];
}

- (void)setUpLayout {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:20];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1.0
                                                                      constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                      attribute:NSLayoutAttributeRight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeRight
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self
                                                                       attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0
                                                                        constant:0];

    [self addConstraints:@[topConstraint,leftConstraint,rightConstraint,bottomConstraint]];

}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLabel;
}

@end

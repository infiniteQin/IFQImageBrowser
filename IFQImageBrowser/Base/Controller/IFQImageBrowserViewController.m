//
//  IFQImageBrowserViewController.m
//  Pods
//
//  Created by infiq on 2017/1/5.
//
//

#import "IFQImageBrowserViewController.h"
#import "IFQZoomImageCell.h"

#ifdef SHOW_TITLE_BAR
#import "IFQTitleBar.h"
#endif

static NSString * const kIFQZoomImageCellIdentify = @"IFQZoomImageCell";

@interface IFQImageBrowserViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

#ifdef SHOW_TITLE_BAR
@property (nonatomic, strong) IFQTitleBar *titleBar;
#endif

@end

@implementation IFQImageBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self __initData];
}

- (void)configUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;

    [self configCollectionView];
    [self configTitleBar];
}

- (void)configCollectionView {

    [self.view addSubview:self.collectionView];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                                     attribute:NSLayoutAttributeTopMargin
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                                      attribute:NSLayoutAttributeLeftMargin
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                                       attribute:NSLayoutAttributeRightMargin
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                                        attribute:NSLayoutAttributeBottomMargin
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:0 ];

    [self.view addConstraints:@[topConstraint,leftConstraint,rightConstraint,bottomConstraint]];
}

- (void)configTitleBar {
#ifdef SHOW_TITLE_BAR

    [self.view addSubview:self.titleBar];
    self.titleBar.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.titleBar
                                                                     attribute:NSLayoutAttributeTopMargin
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.titleBar
                                                                      attribute:NSLayoutAttributeLeftMargin
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.titleBar
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.titleBar
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:nil
                                                                       multiplier:1.0
                                                                         constant:64 ];
    [self.view addConstraints:@[topConstraint,leftConstraint,rightConstraint,heightConstraint]];
#endif

}

- (void)__initData {
    if (self.images.count<=self.currIndex) {
        self.currIndex = 0;
    }
    if (self.images.count>0) {
        NSIndexPath *currIndexPath = [NSIndexPath indexPathForRow:self.currIndex inSection:0];
        [self.collectionView scrollToItemAtIndexPath:currIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    [self updateTitle];

}

- (void)tapToBack {
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    IFQZoomImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIFQZoomImageCellIdentify forIndexPath:indexPath];
    __weak typeof(self) wSelf = self;
    cell.didTapImageViewBlock = ^(){
        [wSelf tapToBack];
    };
    if (self.webImageLoader && [self.webImageLoader respondsToSelector:@selector(cancelCurrentImageLoad:)]) {
        [self.webImageLoader cancelCurrentImageLoad:cell.imageView];
    }
    id obj = self.images[indexPath.row];

    if(obj && [obj isKindOfClass:[UIImage class]]) {
        cell.imageView.image = obj;
    }else if(obj && [obj isKindOfClass:[NSString class]]) {
        if (self.webImageLoader && [self.webImageLoader respondsToSelector:@selector(imageView:loadWebImage:placeholderImage:)]) {
            [self.webImageLoader imageView:cell.imageView loadWebImage:obj placeholderImage:nil];
        }
    }else if (obj && [obj isKindOfClass:[NSData class]]) {
        UIImage *image = [UIImage imageWithData:obj];
        cell.imageView.image = image;
    }else {
        cell.imageView.image = nil;
    }
    return cell;
}

#pragma mark UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    IFQZoomImageCell *zoomImageCell = cell;
    [zoomImageCell setScale:1];
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = collectionView.bounds.size;
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark UIScroll
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger tempIndex = self.currIndex;
    self.currIndex = (scrollView.contentOffset.x+CGRectGetWidth(scrollView.frame)/2)/CGRectGetWidth(scrollView.frame);
    if (tempIndex != self.currIndex) {
        [self updateTitle];
    }

}

- (void)updateTitle {
    #ifdef SHOW_TITLE_BAR
    if (self.images.count>0) {
        NSString *title = [NSString stringWithFormat:@"%@ / %@",
                           @(self.currIndex+1), @(self.images.count)];
        self.titleBar.titleLabel.text = title;
    }else {
        self.titleBar.titleLabel.text = nil;

    }
    #endif

}

#pragma mark getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        layout.sectionInset = UIEdgeInsetsZero;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView.delegate      = self;
        _collectionView.dataSource    = self;
        _collectionView.pagingEnabled = YES;

        [_collectionView registerClass:[IFQZoomImageCell class] forCellWithReuseIdentifier:kIFQZoomImageCellIdentify];
    }
    return _collectionView;
}

#ifdef SHOW_TITLE_BAR
- (IFQTitleBar*)titleBar {
    if (!_titleBar) {
        _titleBar = [[IFQTitleBar alloc] init];
        _titleBar.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    }
    return _titleBar;
}
#endif

@end

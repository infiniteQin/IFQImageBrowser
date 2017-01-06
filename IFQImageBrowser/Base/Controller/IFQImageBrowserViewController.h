//
//  IFQImageBrowserViewController.h
//  Pods
//
//  Created by infiq on 2017/1/5.
//
//

#import <UIKit/UIKit.h>
#import "IFQImageViewWebImageLoadProtocol.h"

@interface IFQImageBrowserViewController : UIViewController


/**
 图片列表 支持：1.图片string地址；2.NSData类型 3.UIImage类型
 */
@property (nonatomic, strong) NSArray     *images;


/**
 当前展示图片index
 */
@property (nonatomic, assign) NSUInteger  currIndex;


/**
 网络图片加载器 - 用户可以自定义实现IFQImageViewWebImageLoadProtocol接口
 */
@property (nonatomic, strong) id<IFQImageViewWebImageLoadProtocol> webImageLoader;

//@property (nonatomic, copy) void (^didTapImageBlock)(IFQImageBrowserViewController *imageBrowserVC);

@end

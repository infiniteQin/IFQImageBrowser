//
//  IFQCustomWebImageLoader.h
//  IFQImageBrowser
//
//  Created by infiq on 2017/1/5.
//  Copyright © 2017年 lingyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IFQImageBrowser/IFQImageViewWebImageLoadProtocol.h>

@interface IFQCustomWebImageLoader : NSObject<IFQImageViewWebImageLoadProtocol>

+ (instancetype)sharedInstance;

@end

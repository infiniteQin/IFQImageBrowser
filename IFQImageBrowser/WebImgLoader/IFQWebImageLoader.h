//
//  IFQWebImageLoader.h
//  Pods
//
//  Created by infiq on 2017/1/7.
//
//

#import <Foundation/Foundation.h>
#import "IFQImageViewWebImageLoadProtocol.h"

@interface IFQWebImageLoader : NSObject<IFQImageViewWebImageLoadProtocol>

+ (instancetype)imageLoader;

@end

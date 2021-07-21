//
//  ObjectiveCReachabilityManager.m
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

#import <Foundation/Foundation.h>
#import "ObjectiveCReachabilityManager.h"

@implementation ObjectiveCReachabilityManager

+(BOOL)isReachable{
    BOOL status = ReachabilityManager.isReachable;
    return status;
}
@end

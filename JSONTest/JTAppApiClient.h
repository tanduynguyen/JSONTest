//
//  JTAppApiClient.h
//  JSONTest
//
//  Created by viet on 1/17/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface JTAppApiClient : AFHTTPClient

+ (id) sharedInstance;

@end

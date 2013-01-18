//
//  JTAppApiClient.m
//  JSONTest
//
//  Created by viet on 1/17/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JTAppApiClient.h"

static NSString * const JTAppAPIBaseURLString = @"https://api.mongolab.com/";
static NSString * const JTAppAPIToken = @"";

@implementation JTAppApiClient

+ (id)sharedInstance {
    static JTAppApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[JTAppApiClient alloc] initWithBaseURL:
                            [NSURL URLWithString:JTAppAPIBaseURLString]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self setDefaultHeader:@"x-api-token" value:JTAppAPIToken];
        
        
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}


@end

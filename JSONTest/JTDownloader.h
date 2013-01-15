//
//  JTDownloader.h
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTDownloader : NSObject

@property (nonatomic, strong) NSMutableData *data;
@property (assign) BOOL downloadFinish;

- (void)loadData;

@end

//
//  JTJModel.h
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTJModel : NSObject

@property (nonatomic, strong) NSArray *data;

+ (NSArray *) loadData;

@end

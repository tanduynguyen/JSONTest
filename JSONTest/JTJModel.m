//
//  JTJModel.m
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JTJModel.h"
#import "JSONKit.h"

@implementation JTJModel

+ (NSArray *) loadData
{
    NSArray *data;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"name" ofType:@"json"];
    
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    
    id obj = [jsonString objectFromJSONString];
    
    if ([obj isKindOfClass:[NSArray class]]) {
        data = obj;
    }
    
    return data;
}


@end

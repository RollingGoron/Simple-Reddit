//
//  DataSingleton.m
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import "DataSingleton.h"

static DataSingleton *sharedInstance = nil;

@implementation DataSingleton

+(id)sharedInfo {
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[[self class] alloc] init];
        }
        return sharedInstance;
    }
}

@end

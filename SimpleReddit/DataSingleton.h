//
//  DataSingleton.h
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSingleton : NSObject

@property (atomic) NSArray *dataArray;
@property (atomic) NSArray *popularSubredditsArray;

+(DataSingleton *)sharedInfo;

@end

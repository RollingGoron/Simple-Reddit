//
//  DataConnection.h
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSingleton.h"

@interface DataConnection : NSObject

-(void)getRedditFrontPage:(NSString *)subreddit success:(void (^)())success failure:(void(^)())failure;
-(void)getPopularSubreddits:(void (^)())success failure:(void(^)())failure;

@end

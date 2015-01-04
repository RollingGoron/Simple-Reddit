//
//  DataConnection.m
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import "DataConnection.h"

@implementation DataConnection

-(void)getRedditFrontPage:(NSString *)subreddit success:(void (^)())success failure:(void(^)())failure {
    
    NSString *redditURLString = [NSString stringWithFormat:@"https://www.reddit.com/%@/.json", subreddit];
    NSURL *redditURL = [NSURL URLWithString:redditURLString];
    NSURLRequest *redditRequest = [NSURLRequest requestWithURL:redditURL];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:redditRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"No Response from Reddit");
            failure();
        } else {
            NSArray *allJSONData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *childrenData = [allJSONData valueForKey:@"data"];
            [DataSingleton sharedInfo].dataArray = [childrenData valueForKey:@"children"];
            //NSLog(@"%@", jsonData);
            success();
        }
    }];
    
    [dataTask resume];
    
}


-(void)getPopularSubreddits:(void (^)())success failure:(void (^)())failure {
    NSString *redditURLString = [NSString stringWithFormat:@"https://www.reddit.com/subreddits/popular.json"];
    NSURL *redditURL = [NSURL URLWithString:redditURLString];
    NSURLRequest *redditRequest = [NSURLRequest requestWithURL:redditURL];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:redditRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"No Response from Reddit");
            failure();
        } else {
            NSArray *allJSONData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *childrenData = [allJSONData valueForKey:@"data"];
            [DataSingleton sharedInfo].popularSubredditsArray = [childrenData valueForKey:@"children"];
            NSLog(@"%@", [DataSingleton sharedInfo].popularSubredditsArray);
            success();
        }
    }];
    
    [dataTask resume];

}

@end

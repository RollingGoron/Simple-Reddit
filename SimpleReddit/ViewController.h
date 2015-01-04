//
//  ViewController.h
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataConnection.h"
#import "DataSingleton.h"
#import "UIImageView+WebCache.h"
#import "DetailViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSArray *redditArray;
@property NSString *redditURL;


@property IBOutlet UITableView *redditTableView;



@end


//
//  DetailViewController.h
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : UIViewController <UIWebViewDelegate>

@property IBOutlet UIWebView *webView;
@property NSString *urlString;


@end

//
//  ViewController.m
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@", _redditURL];
    
    self.redditTableView.dataSource = self;
    self.redditTableView.delegate = self;
    
    DataConnection *connection = [[DataConnection alloc] init];
    [connection getRedditFrontPage:_redditURL success:^{

        NSLog(@"%lu", (unsigned long)[[DataSingleton sharedInfo].dataArray count]);
        
      
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _redditArray = [[DataSingleton sharedInfo].dataArray valueForKey:@"data"];
            [self.redditTableView reloadData];
        });
        
    }failure:^{
        NSLog(@"Failed to load!");
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[DataSingleton sharedInfo].dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *tempArray = [_redditArray objectAtIndex:indexPath.row];
    //NSLog(@"%@", tempArray);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *titleOfPost = (UILabel *)[cell viewWithTag:1];
    
    titleOfPost.text = [tempArray valueForKey:@"title"];
    
    UIButton *comments = (UIButton *)[cell viewWithTag:2];
    
    comments.titleLabel.text = [NSString stringWithFormat:@"%@", [tempArray valueForKey:@"num_comments"]];
    
    UIImageView *thumbnail = (UIImageView *)[cell viewWithTag:3];
    
    [thumbnail sd_setImageWithURL:[tempArray valueForKey:@"thumbnail"]];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *urlArray = [_redditArray objectAtIndex:indexPath.row];
    
    DetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailView.urlString = [urlArray valueForKey:@"url"];
    [self.navigationController pushViewController:detailView animated:YES];
}


@end

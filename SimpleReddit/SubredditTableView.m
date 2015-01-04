//
//  SubredditTableView.m
//  SimpleReddit
//
//  Created by Peter Gosling on 1/3/15.
//  Copyright (c) 2015 Sunfire Soft. All rights reserved.
//

#import "SubredditTableView.h"

@interface SubredditTableView ()

@end

@implementation SubredditTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Reddit! Choose a Popular Subreddit";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    DataConnection *connection = [[DataConnection alloc] init];
    
    [connection getPopularSubreddits:^{
        
    
        dispatch_async(dispatch_get_main_queue(), ^{
            _popularArray = [[DataSingleton sharedInfo].popularSubredditsArray valueForKey:@"data"];
            [self.tableView reloadData];
           // NSLog(@"%@", _popularArray);
        });
        
        
    }failure:^{
        NSLog(@"Failed to Load Subreddits");
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[DataSingleton sharedInfo].popularSubredditsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *tempArray = [_popularArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@", [tempArray valueForKey:@"title"]);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubredditCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [tempArray valueForKey:@"url"];
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *urlArray = [_popularArray objectAtIndex:indexPath.row];
    ViewController *redditController = [self.storyboard instantiateViewControllerWithIdentifier:@"RedditListController"];
    redditController.redditURL = [urlArray valueForKey:@"url"];
    
    [self.navigationController pushViewController:redditController animated:YES];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

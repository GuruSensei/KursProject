//
//  PostsTableViewController.m
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/19/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import "PostsTableViewController.h"
#import "PostsTableViewCell.h"

@interface PostsTableViewController ()<UITableViewDataSource, UITabBarDelegate>

@end

@implementation PostsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1)]];
        [self.navigationItem setTitle:self.title];
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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.postsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.postsArray[indexPath.row];
    PostsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostsTableViewCell" forIndexPath:indexPath];
    cell.messageLable.text = dict[@"message"];
    cell.dateLabel.text = dict[@"created"];
    cell.toLabel.text = dict[@"addressee"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

@end

//
//  TeacgerTableViewController.m
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import "TeacherTableViewController.h"
#import "TeacherTableViewCell.h"
#import "APIClient.h"
#import "Teacher.h"
#import "MBProgressHUD.h"
#import "SubjectsTableViewController.h"

@interface TeacherTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *teachersArray;
@property (nonatomic, strong) Teacher *currentTeacher;

@end

@implementation TeacherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.teachersArray = [[NSMutableArray alloc]init];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[APIClient sharedClient] teachers:(NSMutableArray *)self.teachersArray success:^(AFHTTPRequestOperation *operation, NSMutableArray *array) {
        [self.tableView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1)]];
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

    return [self.teachersArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Teacher *tempTeacher = self.teachersArray[indexPath.row];
    
    TeacherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherTableViewCell" forIndexPath:indexPath];
    
    [cell.teacherNameLabel setText:tempTeacher.fullName];
  //  [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentTeacher = self.teachersArray[indexPath.row];
    [self performSegueWithIdentifier:@"teachersToSubjects" sender:nil];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"teachersToSubjects"])
    {
        SubjectsTableViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.teacher = self.currentTeacher;
    }
}
@end

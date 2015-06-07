//
//  SubjectsTableViewController.m
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import "SubjectsTableViewController.h"
#import "PostsTableViewController.h"
#import "TeacherTableViewCell.h"
#import "APIClient.h"
#import "MBProgressHUD.h"
#import "Subject.h"

@interface SubjectsTableViewController ()<UITableViewDelegate,UITableViewDataSource, UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableArray *subjectsArray;
@property (nonatomic, strong) Subject *currentSubject;
@property (nonatomic, strong) NSMutableArray *postsArray;

@end

@implementation SubjectsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:self.teacher.fullName];
    self.subjectsArray = [[NSMutableArray alloc]init];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[APIClient sharedClient] subjectsForTeacher:self.teacher withSubjects:self.subjectsArray success:^(AFHTTPRequestOperation *operation, Teacher *teacher, NSMutableArray *array)
    {
        [self.tableView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        [[[UIAlertView alloc]initWithTitle:@"Message" message:@"Unluckily this teacher has no subjects for now" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }];
     [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.subjectsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Subject *tempSubject = self.subjectsArray[indexPath.row];
    TeacherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherTableViewCell" forIndexPath:indexPath];
    
    [cell.teacherNameLabel setText:tempSubject.name];
    
    return cell;

}

 -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentSubject = self.subjectsArray[indexPath.row];
    [self sortData];
   }

-(void) sortData
{
    self.postsArray = [[NSMutableArray alloc]init];
      [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[APIClient sharedClient] postsForTeacher:self.teacher withPosts:(NSMutableArray *)self.postsArray
                                      success:^(AFHTTPRequestOperation *operation, Teacher *teacher, NSMutableArray *array) {
                                        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
                                          [self performSegueWithIdentifier:@"subjectsToPosts" sender:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    }];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"subjectsToPosts"]) {
        PostsTableViewController *destionationViewController = segue.destinationViewController;
        destionationViewController.postsArray = self.postsArray;
        destionationViewController.title = self.currentSubject.name;
    }
}
@end

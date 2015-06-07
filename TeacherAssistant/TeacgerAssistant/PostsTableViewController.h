//
//  PostsTableViewController.h
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/19/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *postsArray;
@property (nonatomic, strong) NSString *title;

@end

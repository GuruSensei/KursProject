//
//  PostsTableViewCell.h
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/19/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *messageLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;

@end

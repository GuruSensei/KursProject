//
//  Teacher.m
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import "Teacher.h"

NSString *const TeacherFullName                      = @"full_name";
NSString *const TeacherUserName                      = @"username";
NSString *const TeacherIsStaff                       = @"is_staff";

@implementation Teacher

- (id)attributes
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    [attributes setValue:self.fullName                     forKey:TeacherFullName];
    [attributes setValue:self.userName                     forKey:TeacherUserName];
    [attributes setValue:self.isStaff                      forKey:TeacherIsStaff];
    
    return attributes;
}

- (void)setAttributes:(id)attributes
{
    
    self.fullName                = [attributes valueForKey: TeacherFullName];
    self.userName                = [attributes valueForKey: TeacherUserName];
    self.isStaff                 =  [[attributes valueForKey: TeacherIsStaff]  isEqualToString: @"False"]?[NSNumber numberWithBool:NO]:[NSNumber numberWithBool:YES];
}

@end

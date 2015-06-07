//
//  Subject.m
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import "Subject.h"


NSString *const SubjectId                        = @"id";
NSString *const SubjectName                      = @"name";
NSString *const FullName                         = @"full_name";
NSString *const UserName                         = @"username";


@implementation Subject

-(id)attributes
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    [attributes setValue:self.subjectId                     forKey:SubjectId];
    [attributes setValue:self.name                          forKey:SubjectName];
    [attributes setValue:self.teacherUserName               forKey:UserName];
    [attributes setValue:self.teacherFullName               forKey:FullName];
    
    return attributes;
}

- (void)setAttributes:(id)attributes
{
    NSDictionary *teacher = attributes[@"teacher"];
    self.teacherFullName                = [teacher valueForKey: FullName];
    self.teacherUserName                = [teacher valueForKey: UserName];
    self.name                           = [attributes valueForKey:SubjectName];
    self.subjectId                      = [attributes valueForKey:SubjectId];
}
@end

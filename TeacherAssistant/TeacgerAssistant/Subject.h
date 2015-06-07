//
//  Subject.h
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"

@interface Subject : NSObject

@property (nonatomic, strong) NSNumber *subjectId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *teacherFullName;
@property (nonatomic, strong) NSString *teacherUserName;

@property (nonatomic, strong) id attributes;
@end

//
//  Teacher.h
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSNumber *isStaff;

@property (nonatomic,strong) id attributes;

@end

//
//  APIClient.h
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "Teacher.h"

@interface APIClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

-(void)teachers:(NSMutableArray *)teachersArray
        success:(void (^)(AFHTTPRequestOperation *, NSMutableArray*))success
        failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure;

-(void)subjectsForTeacher:(Teacher *)teacher withSubjects:(NSMutableArray *) subjects
                  success:(void (^)(AFHTTPRequestOperation *, Teacher*, NSMutableArray *))success
                  failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure;

-(void)postsForTeacher:(Teacher *)teacher withPosts:(NSMutableArray *) subjects
               success:(void (^)(AFHTTPRequestOperation *, Teacher*, NSMutableArray *))success
               failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure;
@end

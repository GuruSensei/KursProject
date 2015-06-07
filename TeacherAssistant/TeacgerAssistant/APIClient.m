//
//  APIClient.m
//  TeacgerAssistant
//
//  Created by Stas Tomych on 12/18/14.
//  Copyright (c) 2014 Stas Tomych. All rights reserved.
//

#import "APIClient.h"
#import "Teacher.h"
#import "Subject.h"

static NSString *const baseString                     = @"http://fyfar.pythonanywhere.com/api/";

@implementation APIClient


+ (instancetype)sharedClient
{
    static id __defaultClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:baseString];
        __defaultClient = [[self alloc] initWithBaseURL:baseURL];
        
    });
    return __defaultClient;
}
//http://fyfar.pythonanywhere.com/api/users/

-(void)teachers:(NSMutableArray *)teachersArray
        success:(void (^)(AFHTTPRequestOperation *, NSMutableArray*))success
        failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self GET:@"http://fyfar.pythonanywhere.com/api/users" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *dict in responseObject[@"teachers"])
        {
            Teacher *teacher = [[Teacher alloc]init];
            teacher.attributes = dict;
            [teachersArray addObject:teacher];
        }
        if(success){
            success(operation,teachersArray);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


-(void)subjectsForTeacher:(Teacher *)teacher withSubjects:(NSMutableArray *) subjects
                  success:(void (^)(AFHTTPRequestOperation *, Teacher*, NSMutableArray *))success
                  failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self GET:[NSString stringWithFormat:@"http://fyfar.pythonanywhere.com/api/lessons/?user=%@",teacher.userName] parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *dict in responseObject[@"lessons"])
        {
            Subject *temp = [[Subject alloc]init];
            temp.attributes = dict;
            [subjects addObject:temp];
        }
        if(success){
            success(operation,teacher,subjects);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure)
        {
            failure(operation, error);
        }
    }];

}

-(void)postsForTeacher:(Teacher *)teacher withPosts:(NSMutableArray *) postsArray
                  success:(void (^)(AFHTTPRequestOperation *, Teacher*, NSMutableArray *))success
                  failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self GET:@"http://fyfar.pythonanywhere.com/api/posts" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for(NSDictionary *dict in responseObject[@"posts"])
        {
            [postsArray addObject:dict];
        }
        if(success){
            success(operation,teacher,postsArray);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure)
        {
            failure(operation, error);
        }
    }];
    
}
@end

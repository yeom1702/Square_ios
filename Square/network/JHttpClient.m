//
//  JHttpClient.m
//  JoinsLand
//
//  Created by misolab on 2015. 11. 9..
//  Copyright (c) 2015년 joins. All rights reserved.
//

#import "JHttpClient.h"
#import <SBJson/SBJson4.h>

#define _USE_SBJSON_ (0)


@interface JHttpClient()

@property(nonatomic, retain) SBJson4Parser * parser;
@property(nonatomic, retain) id jsonParseBlock;
@property(nonatomic, retain) id jsonParseError;

@end

@implementation JHttpClient

+ (NSString *)path:(NSString*)key
{
    return [NSString stringWithFormat:@"https://api.joinsland.joins.com/app/news/%@.asp", key];
}

- (NSString *)url:(NSString*)key
{
    NSString * domain = [JHttpClient path:key];
    NSString * retValue = [NSString stringWithFormat:@"%@?os=%@&osver=%@&model=%@&appver=%@&device_number=%@",
                           domain, _xOS, _xOSVer, _xModel, _xAppVersion, _xDeviceNumber];
    return [retValue stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (id) initWithDelegate:(id)delegate
{
    if (self = [super init]) {
        DeviceInfo * deviceInfo = [DeviceInfo sharedInstance];
        
        _xAppVersion = deviceInfo.property[@"app_ver"];
        _xDeviceNumber = deviceInfo.property[@"device_number"];
        _xOS = deviceInfo.property[@"os"];
        _xOSVer = deviceInfo.property[@"os_ver"];
        _xModel = deviceInfo.property[@"model"];
                
        _delegate = delegate;
        
#if _USE_SBJSON_
        _jsonParseBlock = ^(id obj, BOOL *ignored) {
            NSLog(@"\nparse>%@", obj);
        };
        _jsonParseError = ^(NSError *err) {
            NSLog(@"\nerror>%@", err);
        };
        _parser = [SBJson4Parser parserWithBlock:_jsonParseBlock
                                  allowMultiRoot:NO
                                 unwrapRootArray:NO
                                    errorHandler:_jsonParseError];
#endif
    }
    
    return self;
}

- (AFHTTPRequestOperationManager*) manager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
{
    AFHTTPRequestOperationManager *manager = [self manager];
    return [manager GET:URLString
             parameters:parameters
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
#if _USE_SBJSON_
                    [self.parser parse:responseObject];
#else
                    id json = [JoinsLand jsonByData:responseObject];
                    
                    if ([json isKindOfClass:[NSDictionary class]]) {
                        [self.delegate httpClient:self didReceiveDictionary:json];
                    }else if([json isKindOfClass:[NSArray class]]){
                        [self.delegate httpClient:self didReceiveArray:json];
                    }
#endif
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSString * statusCode = [NSString stringWithFormat:@"%ld", operation.response.statusCode];
                    NSString * bodyMessage = [[NSString alloc] initWithData:operation.responseObject
                                                                   encoding:NSUTF8StringEncoding];
                    if ([JoinsLand empty:bodyMessage]) {
                        bodyMessage = @"";
                    }
                    [self.delegate httpClient:self didReceiveError:@{@"code":statusCode, @"body":bodyMessage}];
                }];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters
{
    AFHTTPRequestOperationManager *manager = [self manager];
    return [manager POST:URLString
              parameters:parameters
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
#if _USE_SBJSON_
                     [self.parser parse:responseObject];
#else
                     id json = [JoinsLand jsonByData:responseObject];
                     
                     if ([json isKindOfClass:[NSDictionary class]]) {
                         [self.delegate httpClient:self didReceiveDictionary:json];
                     }else if([json isKindOfClass:[NSArray class]]){
                         [self.delegate httpClient:self didReceiveArray:json];
                     }
#endif
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSString * statusCode = [NSString stringWithFormat:@"%ld", operation.response.statusCode];
                     NSString * bodyMessage = [[NSString alloc] initWithData:operation.responseObject
                                                                    encoding:NSUTF8StringEncoding];
                     if ([JoinsLand empty:bodyMessage]) {
                         bodyMessage = @"";
                     }
                     [self.delegate httpClient:self didReceiveError:@{@"code":statusCode, @"body":bodyMessage}];
                 }];
    
}

- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString
                        parameters:(id)parameters
{
    AFHTTPRequestOperationManager *manager = [self manager];
    return [manager DELETE:URLString
                parameters:parameters
                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       id json = [JoinsLand jsonByData:responseObject];
                       
                       if ([json isKindOfClass:[NSDictionary class]]) {
                           [self.delegate httpClient:self didReceiveDictionary:json];
                       }else if([json isKindOfClass:[NSArray class]]){
                           [self.delegate httpClient:self didReceiveArray:json];
                       }
                   }
                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       NSString * statusCode = [NSString stringWithFormat:@"%ld", operation.response.statusCode];
                       NSString * bodyMessage = [[NSString alloc] initWithData:operation.responseObject
                                                                      encoding:NSUTF8StringEncoding];
                       if ([JoinsLand empty:bodyMessage]) {
                           bodyMessage = @"";
                       }
                       [self.delegate httpClient:self didReceiveError:@{@"code":statusCode, @"body":bodyMessage}];
                   }];
}

- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                     parameters:(id)parameters
{
    AFHTTPRequestOperationManager *manager = [self manager];
    return [manager PUT:URLString
             parameters:parameters
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    id json = [JoinsLand jsonByData:responseObject];
                    
                    if ([json isKindOfClass:[NSDictionary class]]) {
                        [self.delegate httpClient:self didReceiveDictionary:json];
                    }else if([json isKindOfClass:[NSArray class]]){
                        [self.delegate httpClient:self didReceiveArray:json];
                    }
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSString * statusCode = [NSString stringWithFormat:@"%ld", operation.response.statusCode];
                    NSString * bodyMessage = [[NSString alloc] initWithData:operation.responseObject
                                                                   encoding:NSUTF8StringEncoding];
                    if ([JoinsLand empty:bodyMessage]) {
                        bodyMessage = @"";
                    }
                    [self.delegate httpClient:self didReceiveError:@{@"code":statusCode, @"body":bodyMessage}];
                }];
}


@end

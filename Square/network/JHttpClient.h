//
//  JHttpClient.h
//  JoinsLand
//
//  Created by misolab on 2015. 11. 9..
//  Copyright (c) 2015년 joins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
//#import "JoinsLand.h"
//#import "DeviceInfo.h"

@class JHttpClient;

@protocol JHttpClientDelegate <NSObject>

@optional
- (void) httpClient:(JHttpClient*)client didReceiveArray:(NSArray*)result;
- (void) httpClient:(JHttpClient*)client didReceiveDictionary:(NSDictionary*)result;

@required
- (void) httpClient:(JHttpClient *)client didReceiveError:(NSDictionary*)error;

//- (void) httpClient:(JHttpClient *)client didFailWithError:(NSError*)error;
@end


@interface JHttpClient : NSObject

@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) id<JHttpClientDelegate> delegate;

@property (nonatomic, readonly) NSString * xAppVersion;
@property (nonatomic, readonly) NSString * xOS;
@property (nonatomic, readonly) NSString * xOSVer;
@property (nonatomic, readonly) NSString * xModel;
@property (nonatomic, readonly) NSString * xDeviceNumber;

- (id) initWithDelegate:(id)delegate;

+ (NSString *)path:(NSString*)key;

- (NSString *)url:(NSString*)key;

- (AFHTTPRequestOperationManager*) manager;

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters;

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters;

- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString
                        parameters:(id)parameters;

- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                     parameters:(id)parameters;





@end

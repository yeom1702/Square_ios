//
//  Square.h
//  Square_ios
//
//  Created by Yeom on 2016. 9. 9..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BBBadgeBarButtonItem/BBBadgeBarButtonItem.h>

@interface Square : NSObject

+ (BBBadgeBarButtonItem*) createBarButtonItemWithBadgeValue:(NSString*)badgeValue
                                                  imageName:(NSString*)imageName
                                                     target:(id)target
                                                     action:(SEL)action;
+ (BBBadgeBarButtonItem*) createBarButtonItemWithBadgeValue:(NSString*)badgeValue imageName:(NSString*)imageName;

+ (BOOL) empty:(NSString*)string;

@end

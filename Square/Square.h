//
//  Square.h
//  Square_ios
//
//  Created by Yeom on 2016. 9. 9..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BBBadgeBarButtonItem/BBBadgeBarButtonItem.h>
#import <BFPaperCheckbox/BFPaperCheckbox.h>
#import <UIAlertView+Blocks/UIAlertView+Blocks.h>

@interface Square : NSObject

+ (BBBadgeBarButtonItem*) createBarButtonItemWithBadgeValue:(NSString*)badgeValue
                                                  imageName:(NSString*)imageName
                                                     target:(id)target
                                                     action:(SEL)action;
+ (BBBadgeBarButtonItem*) createBarButtonItemWithBadgeValue:(NSString*)badgeValue imageName:(NSString*)imageName;

+ (void) simpleAlert:(NSString*)message;

+ (BOOL) empty:(NSString*)string;

@end

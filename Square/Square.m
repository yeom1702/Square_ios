//
//  Square.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 9..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "Square.h"

@implementation Square

+ (BBBadgeBarButtonItem*) createBarButtonItemWithBadgeValue:(NSString*)badgeValue
                                                  imageName:(NSString*)imageName
                                                     target:(id)target
                                                     action:(SEL)action
{
    UIImage * image = [UIImage imageNamed:imageName];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIButton *customButton = [[UIButton alloc] initWithFrame:frame];
    [customButton setImage:image forState:UIControlStateNormal];
    
    [customButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:customButton];
    if (![Square empty:badgeValue]) {
        barButton.badgeValue = badgeValue;
    }
    return barButton;
}



+ (BBBadgeBarButtonItem*) createBarButtonItemWithBadgeValue:(NSString*)badgeValue
                                                  imageName:(NSString*)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIButton *customButton = [[UIButton alloc] initWithFrame:frame];
    [customButton setImage:image forState:UIControlStateNormal];
    
    BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:customButton];
    if (![Square empty:badgeValue]) {
        barButton.badgeValue = badgeValue;
    }
    return barButton;
}

+ (void) simpleAlert:(NSString*)message
{
    [UIAlertView showWithTitle:nil
                       message:message
             cancelButtonTitle:@"확인"
             otherButtonTitles:nil
                      tapBlock:nil];
}

+ (BOOL) empty:(NSString*)string
{
    if (string) {
        if ([string length] > 0) {
            return NO;
        }
    }
    return YES;
}

@end

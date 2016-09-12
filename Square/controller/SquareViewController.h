//
//  SquareViewController.h
//  Square_ios
//
//  Created by Yeom on 2016. 9. 2..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SquareViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewPoll;

- (IBAction) detectRight:(UISwipeGestureRecognizer *)recognizer;
- (IBAction) detectleft:(UISwipeGestureRecognizer *)recognizer;

@end

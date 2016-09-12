//
//  SquareViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 2..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "SquareViewController.h"
#import "Square.h"

@interface SquareViewController ()

@end

typedef enum : NSUInteger {
    
    kTagCategory = 1010, //
    kTagTitle, //
    kTagText, //
    kTagDetail,
    
    kTagPName = 1020,
    kTagPTitle,
    kTagPPhoto,
    kTagPText,
    kTagPDetail,
    
    kTagNName = 1030,
    kTagNTitle,
    kTagNPhoto,
    kTagNText,
    kTagNDetail,
    
    kTagViewPoll = 1000,
    kTagPCount, //
    kTagNCount, //
    
    kTagArrowLeft = 1100, //
    kTagCheckLeft, //
    kTagLabelLeft, //
    
    kTagArrowRight = 1200, //
    kTagCheckRight, //
    kTagLabelRight, //
    
    kTagButtonPositive = 1300, //
    kTagButtonNegative, //
    
    kTagClientDiscuss = 10000,
    kTagClientPoll,
    kTagClientPollCancel,
    
} kTagDiscuss;

@implementation SquareViewController {
    float WIDTH;
    float CENTER;
    float GAP;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [Square createBarButtonItemWithBadgeValue:nil
                                                                            imageName:@"ic_arrow_back"
                                                                               target:self
                                                                               action:@selector(close)];
}

- (void) viewDidLayoutSubviews
{
    // Do any additional setup after loading the view.
    WIDTH = self.view.frame.size.width;
    CENTER = self.view.center.x;
    GAP = (self.viewPoll.frame.size.width - self.view.frame.size.width)/2;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self moveToCenter];
}

-(void)viewDidDisappear:(BOOL)animated {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) close
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - swipe
- (IBAction) detectRight:(UISwipeGestureRecognizer *)recognizer
{
    CGPoint toPoint = self.viewPoll.center;
    if (toPoint.x < CENTER) {
        [self moveToCenter];
        return;
    }
    
    [self moveToLeft];
}

- (IBAction) detectleft:(UISwipeGestureRecognizer *)recognizer
{
    CGPoint toPoint = self.viewPoll.center;
    if (toPoint.x > CENTER) {
        [self moveToCenter];
        return;
    }
    
    [self moveToRight];
}


- (void) moveToCenter
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         CGPoint toPoint = self.viewPoll.center;
                         toPoint.x = CENTER;
                         self.viewPoll.center = toPoint;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"complte moveToCenter!!");
                         [self showPollButton:NO];
                     }];
}

- (void) moveToLeft
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         CGRect frame = self.viewPoll.frame;
                         frame.origin.x = 0.0;
                         self.viewPoll.frame = frame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"complte moveToLeft!!");
                         
                         [self showPollButton:YES];
                     }];
}

- (void) moveToRight
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         CGPoint toPoint = self.viewPoll.center;
                         toPoint.x = self.view.center.x - GAP;
                         self.viewPoll.center = toPoint;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"complte moveToRight!!");
                         
                         [self showPollButton:YES];
                     }];
}

- (void) showPollButton:(BOOL)show
{
    [[self.viewPoll viewWithTag:kTagArrowLeft] setHidden:show];
    [[self.viewPoll viewWithTag:kTagLabelLeft] setHidden:!show];
    [[self.viewPoll viewWithTag:kTagCheckLeft] setHidden:!show];
    
    [[self.viewPoll viewWithTag:kTagArrowRight] setHidden:show];
    [[self.viewPoll viewWithTag:kTagCheckRight] setHidden:!show];
    [[self.viewPoll viewWithTag:kTagLabelRight] setHidden:!show];
}

@end

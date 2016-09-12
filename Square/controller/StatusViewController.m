//
//  StatusViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 2..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "StatusViewController.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setProfile];
}

-(void)setProfile {
    UIImageView *infoImage = (UIImageView *)[self.view viewWithTag:100];
    UILabel *infoName = (UILabel *)[self.view viewWithTag:101];
    UILabel *infoGender = (UILabel *)[self.view viewWithTag:102];
    UILabel *infoAge = (UILabel *)[self.view viewWithTag:103];
    UILabel *infoBday = (UILabel *)[self.view viewWithTag:104];
    
    infoImage.image = [UIImage imageNamed:@"girl03.jpeg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

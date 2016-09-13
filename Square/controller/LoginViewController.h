//
//  LoginViewController.h
//  Square_ios
//
//  Created by Yeom on 2016. 9. 13..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *idLabel;
@property (weak, nonatomic) IBOutlet UITextField *pwLabel;
- (IBAction)btnLogin:(UIButton *)sender;

@end
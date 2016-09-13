//
//  LoginViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 13..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "LoginViewController.h"
#import "Square.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnLogin:(UIButton *)sender {
    if ([_idLabel.text isEqualToString:@"yeom"] && [_pwLabel.text isEqualToString:@"1702"]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UITabBarController *main = [storyboard instantiateViewControllerWithIdentifier:@"main"];
        [self.navigationController pushViewController:main animated:YES];
    } else {
        [Square simpleAlert:@"아이디 혹은 비밀번호를 확인해주세요"];
    }
}

@end

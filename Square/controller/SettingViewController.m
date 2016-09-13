//
//  SettingViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 2..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "SettingViewController.h"
#import <BFPaperCheckbox/BFPaperCheckbox.h>

@interface SettingViewController ()

@property NSMutableArray *issueCategory;
@property NSMutableArray *favoriteArray;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _issueCategory = [@[@"정치", @"연예", @"사회", @"스포츠", @"세계", @"생활", @"임시1", @"임시2"] mutableCopy];
    
    _favoriteArray = [@[] mutableCopy];
    
    [self setProfile];
    [self setIssueCategory];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [self checkFavorite];
    NSDictionary *notiDic = [[NSDictionary alloc] initWithObjectsAndKeys:_favoriteArray, @"favorite", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"setFavorite" object:nil userInfo:notiDic];
    [_favoriteArray removeAllObjects];
    
}

- (void)setProfile {
    UIImageView *infoImage = (UIImageView *)[self.view viewWithTag:100];
//    UILabel *infoName = (UILabel *)[self.view viewWithTag:101];
//    UILabel *infoGender = (UILabel *)[self.view viewWithTag:102];
//    UILabel *infoAge = (UILabel *)[self.view viewWithTag:103];
//    UILabel *infoBday = (UILabel *)[self.view viewWithTag:104];
    
    infoImage.image = [UIImage imageNamed:@"girl03.jpeg"];
}

- (void)setIssueCategory {
    for (int i = 0; i < _issueCategory.count; i++) {
        UILabel *label = (UILabel*)[self.view viewWithTag:301+i];
        label.text = _issueCategory[i];
    }
}

- (void)checkFavorite {
    for (int i = 0; i < _issueCategory.count; i++) {
        BFPaperCheckbox *checkBox = (BFPaperCheckbox *)[self.view viewWithTag:401+i];
        
        if([checkBox isChecked]) {
            UILabel *label = (UILabel*)[self.view viewWithTag:301+i];
            [_favoriteArray addObject:label.text];
        }
    }
    
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

@end

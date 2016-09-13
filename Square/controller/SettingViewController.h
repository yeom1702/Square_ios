//
//  SettingViewController.h
//  Square_ios
//
//  Created by Yeom on 2016. 9. 2..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BFPaperCheckbox/BFPaperCheckbox.h>

@interface SettingViewController : UIViewController

@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory1;
@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory2;
@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory3;
@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory4;
@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory5;
@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory6;
@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory7;
@property (nonatomic, strong) IBOutlet BFPaperCheckbox *chkCategory8;

// 개인정보 갱신
- (void)setProfile;

// 이슈주제 설정
- (void)setIssueCategory;

// 즐겨찾기 설정
- (void)checkFavorite;

@end

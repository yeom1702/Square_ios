//
//  FavoriteViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 12..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "FavoriteViewController.h"
#import "MIResizableTableView.h"

@interface FavoriteViewController () <MIResizableTableViewDataSource, MIResizableTableViewDelegate>

@property (nonatomic,weak) IBOutlet MIResizableTableView *tableView;

@property NSMutableArray *issueCategory;

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView configureWithDelegate:self andDataSource:self];
    _issueCategory = [@[@"정치", @"연예", @"사회", @"스포츠", @"세계", @"생활", @"임시", @"임시"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInResizableTableView:(MIResizableTableView *)resizableTableView {
    
    return 3;
}
- (NSInteger)resizableTableView:(MIResizableTableView *)resizableTableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UIView *)resizableTableView:(MIResizableTableView *)resizableTableView viewForHeaderInSection:(NSInteger)section {
    
    return nil;
}
- (UITableViewCell *)resizableTableView:(MIResizableTableView *)resizableTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForHeaderInSection:(NSInteger)section {
    return 20.f;
}

- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 20.f;
}

- (BOOL)resizableTableViewSectionShouldExpandSection:(NSInteger)section {
    return YES;
}

- (void)resizableTableView:(MIResizableTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end

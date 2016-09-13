//
//  FavoriteViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 12..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "FavoriteViewController.h"
#import "MIResizableTableView.h"

#import "CategoryView.h"
#import "ProductTableViewCell.h"

@interface FavoriteViewController () <MIResizableTableViewDataSource, MIResizableTableViewDelegate>

@property (nonatomic, strong) NSArray <NSDictionary *> *issueList;
@property (nonatomic, strong) NSMutableArray <NSDictionary *> *productsList;

@property (nonatomic, weak) IBOutlet MIResizableTableView *tableView;

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitle:@"즐겨찾기"];
    [self.tableView configureWithDelegate:self andDataSource:self];
    [self.tableView registerNib:[ProductTableViewCell cellNib] forCellReuseIdentifier:[ProductTableViewCell cellIdentifier]];
    
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(setProductCategoryWithNoti:) name:@"setFavorite" object:nil];
    
    self.issueList = @[
                       @{
                           @"category":@"정치",
                           @"products":@[
                                   @{
                                       @"title":@"정치주제1",
                                       @"description":@"정치내용정치내용정치내용정치내용정치내용정치내용",
                                       @"people":@"1232명"
                                       },
                                   @{
                                       @"title":@"정치주제2",
                                       @"description":@"정치내용정치내용정치내용정치내용정치내용정치내용",
                                       @"people":@"1121명"
                                       },
                                   @{
                                       @"title":@"정치주제3",
                                       @"description":@"정치내용정치내용정치내용정치내용정치내용정치내용",
                                       @"people":@"5510명"
                                       },
                                   @{
                                       @"title":@"정치주제4",
                                       @"description":@"정치내용정치내용정치내용정치내용정치내용정치내용",
                                       @"people":@"146명"
                                       },
                                   @{
                                       @"title":@"정치주제5",
                                       @"description":@"정치내용정치내용정치내용정치내용정치내용정치내용",
                                       @"people":@"133명"
                                       }
                                   ]
                           },
                       @{
                           @"category":@"연예",
                           @"products":@[
                                   @{
                                       @"title":@"연예주제1",
                                       @"description":@"연예내용연예내용연예내용연예내용연예내용연예내용",
                                       @"people":@"2233명"
                                       },
                                   @{
                                       @"title":@"연예주제2",
                                       @"description":@"연예내용연예내용연예내용연예내용연예내용연예내용",
                                       @"people":@"521명"
                                       },
                                   @{
                                       @"title":@"연예주제3",
                                       @"description":@"연예내용연예내용연예내용연예내용연예내용연예내용",
                                       @"people":@"850명"
                                       }
                                   ]
                           },
                       @{
                           @"category":@"사회",
                           @"products":@[
                                   @{
                                       @"title":@"사회주제1",
                                       @"description":@"사회내용사회내용사회내용사회내용사회내용사회내용",
                                       @"people":@"233명"
                                       },
                                   @{
                                       @"title":@"사회주제2",
                                       @"description":@"사회내용사회내용사회내용사회내용사회내용사회내용",
                                       @"people":@"21명"
                                       }
                                   ]
                           },
                       @{
                           @"category":@"스포츠",
                           @"products":@[
                                   @{
                                       @"title":@"스포츠주제1",
                                       @"description":@"스포츠내용스포츠내용스포츠내용스포츠내용스포츠내용",
                                       @"people":@"415명"
                                       },
                                   @{
                                       @"title":@"스포츠주제2",
                                       @"description":@"스포츠내용스포츠내용스포츠내용스포츠내용스포츠내용",
                                       @"people":@"150명"
                                       },
                                   @{
                                       @"title":@"스포츠주제3",
                                       @"description":@"스포츠내용스포츠내용스포츠내용스포츠내용스포츠내용",
                                       @"people":@"162명"
                                       },
                                   @{
                                       @"title":@"스포츠주제4",
                                       @"description":@"스포츠내용스포츠내용스포츠내용스포츠내용스포츠내용",
                                       @"people":@"317명"
                                       },
                                   @{
                                       @"title":@"스포츠주제5",
                                       @"description":@"스포츠내용스포츠내용스포츠내용스포츠내용스포츠내용",
                                       @"people":@"213명"
                                       },
                                   @{
                                       @"title":@"스포츠주제6",
                                       @"description":@"스포츠내용스포츠내용스포츠내용스포츠내용스포츠내용",
                                       @"people":@"180명"
                                       }
                                   ]
                           },
                       @{
                           @"category":@"세계",
                           @"products":@[
                                   @{
                                       @"title":@"세계주제1",
                                       @"description":@"세계내용세계내용세계내용세계내용세계내용세계내용",
                                       @"people":@"154명"
                                       },
                                   @{
                                       @"title":@"세계주제2",
                                       @"description":@"세계내용세계내용세계내용세계내용세계내용세계내용",
                                       @"people":@"502명"
                                       },
                                   @{
                                       @"title":@"세계주제3",
                                       @"description":@"세계내용세계내용세계내용세계내용세계내용세계내용",
                                       @"people":@"1635명"
                                       },
                                   @{
                                       @"title":@"세계주제4",
                                       @"description":@"세계내용세계내용세계내용세계내용세계내용세계내용",
                                       @"people":@"17232명"
                                       },
                                   @{
                                       @"title":@"세계주제5",
                                       @"description":@"세계내용세계내용세계내용세계내용세계내용세계내용",
                                       @"people":@"13124명"
                                       },
                                   @{
                                       @"title":@"세계주제6",
                                       @"description":@"세계내용세계내용세계내용세계내용세계내용세계내용",
                                       @"people":@"1320명"
                                       }
                                   ]
                           },
                       @{
                           @"category":@"생활",
                           @"products":@[
                                   @{
                                       @"title":@"생활주제1",
                                       @"description":@"생활내용생활내용생활내용생활내용생활내용생활내용",
                                       @"people":@"135명"
                                       },
                                   @{
                                       @"title":@"생활주제2",
                                       @"description":@"생활내용생활내용생활내용생활내용생활내용생활내용",
                                       @"people":@"50명"
                                       },
                                   @{
                                       @"title":@"생활주제3",
                                       @"description":@"생활내용생활내용생활내용생활내용생활내용생활내용",
                                       @"people":@"16명"
                                       },
                                   @{
                                       @"title":@"생활주제4",
                                       @"description":@"생활내용생활내용생활내용생활내용생활내용생활내용",
                                       @"people":@"127명"
                                       },
                                   @{
                                       @"title":@"생활주제5",
                                       @"description":@"생활내용생활내용생활내용생활내용생활내용생활내용",
                                       @"people":@"135명"
                                       },
                                   @{
                                       @"title":@"생활주제6",
                                       @"description":@"생활내용생활내용생활내용생활내용생활내용생활내용",
                                       @"people":@"102명"
                                       }
                                   ]
                           },
                       @{
                           @"category":@"임시1",
                           @"products":@[
                                   @{
                                       @"title":@"임시주제1",
                                       @"description":@"임시내용",
                                       @"people":@"156명"
                                       },
                                   @{
                                       @"title":@"임시주제2",
                                       @"description":@"임시내용",
                                       @"people":@"3902명"
                                       }
                                   ]
                           },
                       @{
                           @"category":@"임시2",
                           @"products":@[
                                   @{
                                       @"title":@"임시주제1",
                                       @"description":@"임시내용",
                                       @"people":@"11245명"
                                       },
                                   @{
                                       @"title":@"임시주제2",
                                       @"description":@"임시내용",
                                       @"people":@"532930명"
                                       }
                                   ]
                           },
                       ];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setProductCategoryWithNoti:(NSNotification *)noti {
    NSDictionary *notiDic = [noti userInfo];
    NSSet *favoriteSet = [[NSSet alloc] initWithArray:notiDic[@"favorite"]];
    self.productsList = [@[] mutableCopy];
    
    for (int i = 0; i < _issueList.count; i++) {
        if([favoriteSet containsObject:_issueList[i][@"category"]]) {
            [self.productsList addObject:_issueList[i]];
        }
    }
    
    [self.tableView reloadData];
}

#pragma mark - MIResizableTableViewDataSource
- (NSInteger)numberOfSectionsInResizableTableView:(MIResizableTableView *)resizableTableView {
    
    return self.productsList.count;
}
- (NSInteger)resizableTableView:(MIResizableTableView *)resizableTableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[self.productsList objectAtIndex:section] objectForKey:@"products"] count];
}

- (UIView *)resizableTableView:(MIResizableTableView *)resizableTableView viewForHeaderInSection:(NSInteger)section {
    
    NSDictionary *categoryDictionary = [self.productsList objectAtIndex:section];
    return [CategoryView getViewWithTitle:[categoryDictionary objectForKey:@"category"] andProductsNumber:[[categoryDictionary objectForKey:@"products"] count]];
    
    
}
- (UITableViewCell *)resizableTableView:(MIResizableTableView *)resizableTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductTableViewCell *cell = [resizableTableView dequeueReusableCellWithIdentifier:[ProductTableViewCell cellIdentifier] forIndexPath:indexPath];
    
    NSDictionary *productDictionary = [[[self.productsList objectAtIndex:indexPath.section] objectForKey:@"products"] objectAtIndex:indexPath.row];
    
    [cell configureWithProductTitle:[productDictionary objectForKey:@"title"] description:[productDictionary objectForKey:@"description"] andPeople:[productDictionary objectForKey:@"people"]];
    
    return cell;
    
}

#pragma mark - MIResizableTableViewDelegate
- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}
- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

- (UITableViewRowAnimation)resizableTableViewInsertRowAnimation {
    
    return UITableViewRowAnimationFade;
}
- (UITableViewRowAnimation)resizableTableViewDeleteRowAnimation {
    
    return UITableViewRowAnimationFade;
}

- (BOOL)resizableTableViewSectionShouldExpandSection:(NSInteger)section {
    
    return YES;
}

- (void)resizableTableView:(MIResizableTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *selectedProduct = [[[self.productsList objectAtIndex:indexPath.section] objectForKey:@"products"] objectAtIndex:indexPath.row];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[selectedProduct objectForKey:@"title"] message:[selectedProduct objectForKey:@"description"] preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"보기" style:UIAlertActionStyleDefault handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDestructive handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:^{
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }];
}

@end

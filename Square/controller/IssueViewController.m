//
//  IssueViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 2..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "IssueViewController.h"

@interface IssueViewController ()

@property(nonatomic) CGFloat cellWidth;
@property(nonatomic) CGFloat cellHeight;

@property(nonatomic, strong) NSMutableArray *issueItems;
@property(nonatomic, strong) NSMutableArray *issueCategory;

@end

@implementation IssueViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"이슈";
    
    self.issueItems = [@[] mutableCopy];
    for(int i=0; i<8; i++) {
        [_issueItems addObject:[NSString stringWithFormat:@"girl%02d.jpeg",i]];
    }
    
    _issueCategory = [@[@"정치", @"연예", @"사회", @"스포츠", @"세계", @"생활", @"임시1", @"임시2"] mutableCopy];
    
    //[self reqSearch];
    
    //cell 사이즈 계산
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    self.cellWidth = (screenWidth-1.0f)/2;
    self.cellHeight = self.cellWidth * 145.0f / 187.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  CollectionView setting

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.issueItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //셀
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    //이미지
    //NSString *imgurl = self.issueItems[indexPath.row][@"imgurl"];
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    collectionImageView.image = [UIImage imageNamed:self.issueItems[indexPath.row]];
    
    //라벨
    //NSString *title = self.issueItems[indexPath.row][@"title"];
    UILabel *collectionLabel = (UILabel *)[cell viewWithTag:101];
    collectionLabel.text = self.issueCategory[indexPath.row];
    
    return cell;
}

// 셀 아이템을 선택했을 경우 호출
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

// 컬렉션 셀 크기
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.cellWidth , self.cellHeight);
}

// 컬렉션과 컬렉션 width 간격
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

// 컬렉션과 컬렉션 height 간격
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}


/*
#pragma mark - 데이터 및 통신___________
- (void) reqSearch
{
    JHttpClient * httpClient = [[JHttpClient alloc] initWithDelegate:self];
    [httpClient GET:[httpClient url:@"category"] parameters:nil];
}

#pragma mark - JHttpClientDelegate Delegate___________
- (void) httpClient:(JHttpClient *)client didReceiveError:(NSDictionary*)error{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"오류입니다"
                                                                   message:error[@"body"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void) httpClient:(JHttpClient*)client didReceiveDictionary:(NSDictionary*)result
{
    [self.recvItems addObjectsFromArray:result[@"category"]];
    [self.collectionView reloadData];
}
*/


@end

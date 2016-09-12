//
//  SquareListViewController.m
//  Square_ios
//
//  Created by Yeom on 2016. 9. 7..
//  Copyright © 2016년 Yeom. All rights reserved.
//

#import "SquareListViewController.h"

@interface SquareListViewController ()

@property (nonatomic, strong) NSMutableArray *issueArray;
@property (nonatomic, strong) NSMutableDictionary *issueDict;

@end

@implementation SquareListViewController

static NSString *squareCell = @"squareCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.issueArray = [@[] mutableCopy];
    self.issueDict = [@{@"image": @"girl01.jpeg", @"title": @"전기요금 누진제 완화해야 할까요? 하지말까요? 왜죠?", @"date": @"2016.09.07", @"people": @"118"} mutableCopy];
    
    [_issueArray addObject:_issueDict];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.issueArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:squareCell forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:squareCell];
    }
    
    UIImageView *issueImage = (UIImageView *)[cell viewWithTag:200];
    UILabel *issueTitle = (UILabel *)[cell viewWithTag:201];
    UILabel *issueDate = (UILabel *)[cell viewWithTag:202];
    UILabel *issuePeople = (UILabel *)[cell viewWithTag:203];
    
    issueImage.image = [UIImage imageNamed:self.issueArray[indexPath.row][@"image"]];
    issueTitle.text = self.issueArray[indexPath.row][@"title"];
    issueDate.text = self.issueArray[indexPath.row][@"date"];
    issuePeople.text = [NSString stringWithFormat:@"%d명 참여", [self.issueArray[indexPath.row][@"people"] intValue]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

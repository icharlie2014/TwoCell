//
//  ViewController.m
//  TwoTableCell
//
//  Created by panglong on 16/4/10.
//  Copyright © 2016年 庞龙. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *bigDataArray;

@property (nonatomic, strong) NSArray *mentionDataArray;

@property (strong, nonatomic) IBOutlet UITableView *bigTableView;

@property (strong, nonatomic) NSMutableArray *selectedArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bigTableView.estimatedRowHeight = 246.0;
    self.bigTableView.rowHeight = UITableViewAutomaticDimension;
    
    _bigDataArray = [NSArray arrayWithObjects:@"黑店",@"白店",@"白店",@"黑店",@"黑店",@"黑店",@"白店",@"黑店",@"白店",@"白店",@"白店",@"白店",@"白店", nil];
    _mentionDataArray = [NSArray arrayWithObjects:@"呵呵",@"接下来是一段废话，你想看就认真读完这段废话吧，恭喜你读完了。呵呵",@"呵呵",@"呵呵",@"接下来是一段废话，你想看就认真读完这段废话吧，恭喜你读完了。",@"呵呵",@"呵呵",@"呵呵", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _bigDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    
    cell.shopName = _bigDataArray[indexPath.row];
    
    cell.mentionDataArray = _mentionDataArray;
    
    __weak typeof(self) weakSelf = self;
    
    cell.customSelectedBlock = ^ (BOOL selected, NSInteger row)
    {
        if (selected) {
            
            [weakSelf.selectedArray addObject:@(row)];
            
        }else{
            
            [weakSelf.selectedArray removeObject:@(row)];
        }
    };
    
    if ([self.selectedArray containsObject:@(indexPath.row)]) {
        cell.selectedCell = YES;
    }else{
        cell.selectedCell = NO;
    }
    
    return cell;
}

- (NSMutableArray *)selectedArray
{
    if (_selectedArray == nil) {
        _selectedArray = [NSMutableArray array];
    }
    return _selectedArray;
}
@end

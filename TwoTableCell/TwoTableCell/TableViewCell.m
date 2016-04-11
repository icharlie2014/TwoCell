//
//  TableViewCell.m
//  TwoTableCell
//
//  Created by panglong on 16/4/10.
//  Copyright © 2016年 庞龙. All rights reserved.
//

#import "TableViewCell.h"
#import "SmallCell.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightMentionCons;



@end

@implementation TableViewCell


- (void)setShopName:(NSString *)shopName
{
    _shopName = shopName;
    
    self.shopNameLabel.text = shopName;
}

- (void)setMentionDataArray:(NSArray *)mentionDataArray
{
    _mentionDataArray = mentionDataArray;
    
}

- (void)setSelectedCell:(BOOL)selectedCell
{
    _selectedCell = selectedCell;
    
    if (selectedCell) {
        self.heightMentionCons.constant = _mentionDataArray.count * 44;
    }else{
        self.heightMentionCons.constant = 88;
    }
}

#pragma mark - table data 数据代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _mentionDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SmallCell *cell = [SmallCell cellWithTableView:tableView];
    
    cell.mention = _mentionDataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableView *bigTableView = (UITableView *)tableView.superview.superview.superview.superview;
    
    NSIndexPath *indexPathSuperViewSelected = [bigTableView indexPathForCell:(UITableViewCell *)tableView.superview.superview];
    
    [bigTableView beginUpdates];
    
    if (self.heightMentionCons.constant != (_mentionDataArray.count * 44)) {
        
        self.heightMentionCons.constant = _mentionDataArray.count * 44;
        
        _customSelectedBlock(YES,indexPathSuperViewSelected.row);
        
    }else{
        
        self.heightMentionCons.constant = 88;
        
        _customSelectedBlock(NO,indexPathSuperViewSelected.row);
    }
    
    [bigTableView endUpdates];
}



+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell =  [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
    }
    return cell;
}

@end

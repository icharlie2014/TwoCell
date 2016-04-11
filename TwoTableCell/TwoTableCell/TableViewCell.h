//
//  TableViewCell.h
//  TwoTableCell
//
//  Created by panglong on 16/4/10.
//  Copyright © 2016年 庞龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CustomSelectBlock)(BOOL selected, NSInteger row);

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *mentionDataArray;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) CustomSelectBlock customSelectedBlock;

@property (nonatomic, assign) BOOL selectedCell;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

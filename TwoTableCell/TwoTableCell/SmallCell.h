//
//  SmallCell.h
//  TwoTableCell
//
//  Created by panglong on 16/4/11.
//  Copyright © 2016年 庞龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmallCell : UITableViewCell

@property (nonatomic,copy) NSString *mention;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

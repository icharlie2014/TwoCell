//
//  SmallCell.m
//  TwoTableCell
//
//  Created by panglong on 16/4/11.
//  Copyright © 2016年 庞龙. All rights reserved.
//

#import "SmallCell.h"

@interface SmallCell ()

@property (weak, nonatomic) IBOutlet UILabel *mentionLabel;

@end

@implementation SmallCell

- (void)setMention:(NSString *)mention
{
    _mention = mention;
    
    self.mentionLabel.text = mention;
    
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"SmallCell";
    SmallCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell =  [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
    }
    return cell;
}

@end

//
//  StudentTableViewCell.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "StudentTableViewCell.h"
#import "Student.h"
@implementation StudentTableViewCell

-(void)setMode:(Student *)mode{
//给mode赋值
    _mode=mode;
//给ui赋值
    _IconImageView.image=mode.icon;
    _labID.text=[NSString stringWithFormat:@"ID    %ld",mode.ID];
    _labName.text=[NSString stringWithFormat:@"name    %@",mode.userName];
    _labAge.text=[NSString stringWithFormat:@"age   %ld",mode.age];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

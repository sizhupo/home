//
//  StudentTableViewCell.h
//  02-数据持久化
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
@interface StudentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labAge;
@property (weak, nonatomic) IBOutlet UILabel *labName;
@property (weak, nonatomic) IBOutlet UILabel *labID;
@property (weak, nonatomic) IBOutlet UIImageView *IconImageView;
@property(nonatomic,strong)Student *mode;
@end

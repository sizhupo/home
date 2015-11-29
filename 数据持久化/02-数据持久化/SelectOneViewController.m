//
//  SelectOneViewController.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "SelectOneViewController.h"
#import "DBOperation.h"
#import "Student.h"

@interface SelectOneViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfID;
@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation SelectOneViewController
- (IBAction)selectOneAction:(id)sender{
    //查询
   Student *mode =[[DBOperation sharderHandle] selectOneModeFromId:_tfID.text.integerValue];
    if (mode) {
     [_dataArr addObject:mode];
     //刷新ui
     [_myTable reloadData];
    }
}

- (void)viewDidLoad {
    _dataArr=[NSMutableArray array];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark TableViewDataSource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"cell";
   UITableViewCell *cell=[tableView
                          dequeueReusableCellWithIdentifier:identifier];
    UIImageView  *image;
    UILabel *labId;
    UILabel *labName;
    UILabel *labAge;
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //for in 遍历
    
    for(UIView *temp in cell.contentView.subviews){
        if ([temp isKindOfClass:[UIImageView class]]||[temp isKindOfClass:[UILabel class]]) {
            [temp removeFromSuperview];
        }
    }
    
    image=[[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 80, 80)];
    [cell.contentView addSubview:image];
    
    labId=[[UILabel alloc] initWithFrame:CGRectMake(100, 10, 200, 20)];
    labId.backgroundColor=[UIColor clearColor];
    labId.font=[UIFont systemFontOfSize:17];
    [cell.contentView addSubview:labId];
    
    labName=[[UILabel alloc] initWithFrame:CGRectMake(100, 70,100, 20)];
    labName.backgroundColor=[UIColor clearColor];
    labName.font=[UIFont systemFontOfSize:17];
    [cell.contentView addSubview:labName];
    
    labAge=[[UILabel alloc] initWithFrame:CGRectMake(200, 70, 100, 20)];
    labAge.backgroundColor=[UIColor clearColor];
    labAge.font=[UIFont systemFontOfSize:17];
    [cell.contentView addSubview:labAge];

    //取出模型
    Student *mode=_dataArr[indexPath.row];
    //模型给cell赋值
    image.image=mode.icon;
    labName.text=[NSString stringWithFormat:@"name:    %@",mode.userName];
    labId.text=[NSString stringWithFormat:@"ID:    %ld",mode.ID];
    labAge.text=[NSString stringWithFormat:@"age:    %ld",mode.age];
   return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

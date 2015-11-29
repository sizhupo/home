//
//  SelcetAllViewController.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "SelcetAllViewController.h"
#import "StudentTableViewCell.h"
#import "DBOperation.h"
#import "Student.h"

@interface SelcetAllViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation SelcetAllViewController

-(void)selectAll:(id)sender{
//查询所有的记录
    //单例对象 数据库操作的单例对象
    DBOperation *operation=[DBOperation sharderHandle];
    //返回查询结果
    NSMutableArray *selectArr=[operation selectAll];
    if(selectArr){
        _dataArr=selectArr;
        //刷新ui
        UITableView *myTable=(UITableView *)[self.view viewWithTag:10];
        [myTable reloadData];
        
    }
    
}


-(void)addSubView{
//1butitem
  
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithTitle:@"SelectAll" style:UIBarButtonItemStylePlain target:self action:@selector(selectAll:)];
    self.navigationItem.rightBarButtonItem=item ;
    
//添加tableview
    
    UITableView *myTable=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    myTable.delegate=self;
    myTable.tag=10;
    myTable.rowHeight=100;
    myTable.dataSource=self;
    [self.view addSubview:myTable];
}

#pragma mark delegate DataSource

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  StudentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"StudentTableViewCell" owner:nil options:nil][0];
    }
    //cell赋值
    Student *mode=_dataArr[indexPath.row];
    cell.mode=mode;
    return cell;
}

- (void)viewDidLoad {
    
    [self addSubView];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

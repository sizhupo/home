//
//  QYStuListVC.m
//  01-FMDBDemo
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYStuListVC.h"
#import "QYStudentInfo.h"
#import "AFNetworking.h"
#import "QYCommon.h"

#define kStuListCellID  @"studentCellID"
#define kNotFirst       @"notFirst"
#define kURLStr         @"persons.json"

@interface QYStuListVC ()

//装从网络请求下来的数据（NSArray：优化性能）
@property (nonatomic, strong) NSArray *students;
@end

@implementation QYStuListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 加载学生信息
    [self loadStuInfos];
}

// 1. 加载学生信息
- (void)loadStuInfos
{
    BOOL isNotFirst = [QYUD boolForKey:kNotFirst];
    if (isNotFirst) {
        // 从本地加载数据
        [self loadStuInfosLocal];
        return;
}

    // 从网络请求数据，并更新UI，标记已经不是第一次
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //url接口
    NSString *urlStr = [kBaseURL stringByAppendingPathComponent:kURLStr];
    //参数
    NSDictionary *parameters = @{@"person_type":@"student"};
    //post请求
    [manager POST:urlStr parameters:parameters success:^void(NSURLSessionDataTask *task, id responseObj) {
        //把请求下来的数据（responseObj：字典）转换为模型
        _students = responseObj[@"data"];
        
        //刷新列表
        [self.tableView reloadData];
        
        // 保存数据进数据库
        [self saveStuInfos2DB];
        
    } failure:^void(NSURLSessionDataTask * task, NSError *error) {
        NSLog(@"%@", error);
    }];
}
/**
 *   加载本地数据
 */
- (void)loadStuInfosLocal {
    
}
/**
 *  保存数据
 */
- (void)saveStuInfos2DB
{
    // TODO:
    
    [QYUD setBool:YES forKey:kNotFirst];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.students.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kStuListCellID forIndexPath:indexPath];
    
    // Configure the cell...
    //kvc模式
    cell.textLabel.text = [_students[indexPath.row] valueForKey:kStuName];
    
    return cell;
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

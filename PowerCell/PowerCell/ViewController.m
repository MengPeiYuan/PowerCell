//
//  ViewController.m
//  PowerCell
//
//  Created by jit-mac on 16/8/30.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import "ViewController.h"
#import "PowerCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initData];
    [self initUI];
    
}
-(void)initData{
    for (NSInteger i=0; i<20; i++) {
        Model *model=[[Model alloc]init];
        model.head=@"http://p.3761.com/pic/11691403828697.jpg";
        if (i%2==0) {//文字长短,来展示 label 的适应性
            model.title=@"正月里来是新年啊,大年初一头一天啊哈给我一杯忘情水,换我一夜不流泪,多少真情真爱任它风大雨吹,付出的爱收不";
            model.detail=@"有多少爱可以胡来,有多少人愿意等待,野驴呀,神秘野驴呀,哦, My 野驴呀,野驴呀,神秘野驴呀,哦, My 野驴呀";
        }else{
            model.title=@"开发人员着实魅力十足";
            model.detail=@"开发人员魅力十足,浪里个浪.";
        }
        if (i%4==0) {
            model.image_no=@"NO";//用来展示没有图片是个什么样子
        }else{
            model.image_no=@"YES";
        }
        model.time=@"2013-2-13";
        [self.dataArray addObject:model];
    }
}

-(void)initUI{
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
      static NSString *cellID=@"cellID";
    PowerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[PowerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//        typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
//            UITableViewCellStyleDefault,	// 默认风格，自带标题和一个图片视图，图片在左
//            UITableViewCellStyleValue1,		// 只有标题和副标题 副标题在右边
//            UITableViewCellStyleValue2,		// 只有标题和副标题，副标题在左边标题的下边
//            UITableViewCellStyleSubtitle	// 自带图片视图和主副标题，主副标题都在左边，副标题在下
//        };
    }
    Model *model = self.dataArray[indexPath.row];//通过 model 刷新 cell, 给 cell 赋值
    cell.accessoryType=UITableViewCellAccessoryNone;
    [cell refreshCellWithModel:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellHeight;
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

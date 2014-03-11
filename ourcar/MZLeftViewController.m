//
//  MZLeftViewController.m
//  ourcar
//
//  Created by mazhao on 14-3-10.
//  Copyright (c) 2014年 MZ. All rights reserved.
//

#import "MZLeftViewController.h"



@interface MZLeftViewController ()

@property (nonatomic, strong) UITableView * tableView;
@end

@implementation MZLeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"夜导航";
    
    
    // 左侧导航
    // 夜生活
    // 睡眠监控
    // 话题
    // 个人中心
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ];

    [self.tableView setBackgroundColor:MenuBackgroundColor()];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    }
    
    // @TODO: fix later
    // 夜生活
    // 睡眠监控
    // 话题
    // 个人中心
   
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text =  @"夜生活" ;
            cell.imageView.image = [UIImage imageNamed:@"coctail-25.png"];
            break;
        case 1:
            cell.textLabel.text =  @"睡眠监控" ;
            cell.imageView.image = [UIImage imageNamed:@"sleeping_room-25.png"];
            break;
        case 2:
            cell.textLabel.text =  @"话题" ;
            cell.imageView.image = [UIImage imageNamed:@"topic-25.png"];
            break;
        case 3:
            cell.textLabel.text =  @"个人中心" ;
            cell.imageView.image = [UIImage imageNamed:@"administrator-25.png"];
            break;
            
        default:
            break;
    }
    
    [cell setBackgroundColor:MenuBackgroundColor()];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"table row click:%@", indexPath);
}

@end

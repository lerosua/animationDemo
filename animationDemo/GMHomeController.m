//
//  GMHomeController.m
//  animationDemo
//
//  Created by lerosua on 14-7-24.
//  Copyright (c) 2014年 lerosua. All rights reserved.
//

#import "GMHomeController.h"
#import "GMBasicViewController.h"
#import "GMKeyframeViewController.h"
#import "GMTransitionViewController.h"
#import "GMTransactionViewController.h"
#import "GMGroupViewController.h"

@interface GMHomeController ()

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) NSArray *viewArrays;
@end

@implementation GMHomeController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = @[@"CABasicAnimation动画",@"CAKeyframeAnimation动画",@"CATransition动画",@"CATransaction事务",@"CAAnimationGroup动画"];
    self.viewArrays = @[@"GMBasicViewController",@"GMKeyframeViewController",@"GMTransitionViewController",@"GMTransactionViewController",@"GMGroupViewController"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"animationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    label.text = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString *viewName = [self.viewArrays objectAtIndex:indexPath.row];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:viewName];
    viewController.navigationItem.title = [self.dataSource objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end

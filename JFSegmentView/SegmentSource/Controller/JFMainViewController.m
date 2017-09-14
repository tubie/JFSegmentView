//
//  JFMainViewController.m
//  JFSegmentView
//
//  Created by linjianfang on 2017/9/14.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "JFMainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "JFSegmentView.h"

@interface JFMainViewController ()

@end

@implementation JFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FirstViewController *secondVC = [[FirstViewController alloc]init];
    secondVC.title = @"NBA";
    SecondViewController *thirdVC = [[SecondViewController alloc]init];
    thirdVC.title = @"CBA";
    JFSegmentView *segmentView = [[JFSegmentView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) titleHeight:44 viewControllers:@[secondVC,thirdVC]];
    [self.view addSubview:segmentView];
//        self.navigationItem.titleView = segmentView;

    // Do any additional setup after loading the view.
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

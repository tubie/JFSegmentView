//
//  ViewController.m
//  JFSegmentView
//
//  Created by linjianfang on 2017/9/14.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "JFSegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FirstViewController *secondVC = [[FirstViewController alloc]init];
    secondVC.title = @"NBA";
    SecondViewController *thirdVC = [[SecondViewController alloc]init];
    thirdVC.title = @"CBA";
    JFSegmentView *segmentView = [[JFSegmentView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) titleHeight:44 viewControllers:@[secondVC,thirdVC]];
    [self.view addSubview:segmentView];
//    self.navigationItem.titleView = segmentView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

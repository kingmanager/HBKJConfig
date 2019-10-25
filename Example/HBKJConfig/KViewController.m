//
//  KViewController.m
//  HBKJConfig
//
//  Created by kingmanager on 10/24/2019.
//  Copyright (c) 2019 kingmanager. All rights reserved.
//

#import "KViewController.h"

#import <UIColor+HBKJCode.h>
#import <HBKJSearchbar.h>
#import <HBKJTextView.h>

@interface KViewController ()

@end

@implementation KViewController

- (void)viewDidLoad{
    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor colorFromCode:0xD90000];
    
    HBKJSearchbar *mySearchBar=[[HBKJSearchbar alloc] initWithPlaceholder:@"请输入关键字"];
    mySearchBar.frame=CGRectMake(50, 100, self.view.bounds.size.width-100, 50);
    [self.view addSubview:mySearchBar];
    
    HBKJTextView *myTextView=[[HBKJTextView alloc] initWithFrame:CGRectMake(50, 200, self.view.bounds.size.width-100, 200)];
    myTextView.font=[UIFont systemFontOfSize:12];
    myTextView.placeholder=@"请输入内容...";
    myTextView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:myTextView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

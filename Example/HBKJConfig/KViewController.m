//
//  KViewController.m
//  HBKJConfig
//
//  Created by kingmanager on 10/24/2019.
//  Copyright (c) 2019 kingmanager. All rights reserved.
//

#import "KViewController.h"

#import <UIColor+HBKJCode.h>
#import <HBKJSearchBar.h>
#import <HBKJTextView.h>
#import <HBKJDate.h>

@interface KViewController ()

@end

@implementation KViewController

- (void)viewDidLoad{
    [super viewDidLoad];
        
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)testColorCode{
    self.view.backgroundColor=[UIColor colorFromCode:0xD90000];
}

-(void)testViews{
    HBKJSearchBar *mySearchBar=[[HBKJSearchBar alloc] init];
    mySearchBar.frame=CGRectMake(50, 100, self.view.bounds.size.width-100, 50);
    [self.view addSubview:mySearchBar];
    
    HBKJTextView *myTextView=[[HBKJTextView alloc] initWithFrame:CGRectMake(50, 200, self.view.bounds.size.width-100, 200)];
    myTextView.font=[UIFont systemFontOfSize:12];
    myTextView.placeholder=@"请输入内容...";
    myTextView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:myTextView];
}


@end

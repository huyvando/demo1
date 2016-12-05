//
//  ToolBarViewController.m
//  demo_UINavigationBar
//
//  Created by FCS on 12/4/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import "ToolBarViewController.h"

@interface ToolBarViewController ()

@end

@implementation ToolBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.navigationController.title = @"Second Page";
   // [self addToolbar];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)toolBarItem1:(id)sender{
    [self.label setText:@"Press Play"];
}

-(IBAction)toolBarItem2:(id)sender{
    [self.label setText:@"Press Done"];
}


@end

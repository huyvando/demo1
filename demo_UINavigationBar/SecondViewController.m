//
//  SecondViewController.m
//  demo_UINavigationBar
//
//  Created by FCS on 12/4/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import "SecondViewController.h"
#import "NavigationBarController.h"
#import "ToolBarViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second Page";
    self.secondMore.enabled = false;
    self.secondMore.selectedImage = [UIImage imageNamed:@"home.png"];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(actionGoTo)];
    self.navigationItem.rightBarButtonItem = anotherButton;

}
- (void) actionGoTo {
    ToolBarViewController *tool = [[ToolBarViewController alloc]init];
    [self.navigationController pushViewController:tool animated:YES];
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

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if(tabBar.selectedItem.tag == 0) {
        NavigationBarController *nav = [[NavigationBarController alloc] init];
        [self.navigationController pushViewController:nav animated:NO];
    }
}
@end

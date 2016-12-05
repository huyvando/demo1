//
//  NavigationBarController.h
//  demo_UINavigationBar
//
//  Created by FCS on 12/3/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
@interface NavigationBarController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewSearch;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *favoriteItem;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
- (IBAction)ClickTo:(id)sender;
@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic,strong) NSMutableArray *toList;
@end

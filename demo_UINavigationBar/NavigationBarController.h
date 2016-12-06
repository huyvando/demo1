//
//  NavigationBarController.h
//  demo_UINavigationBar
//
//  Created by FCS on 12/3/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
@interface NavigationBarController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UITabBarDelegate, UITextFieldDelegate, NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewSearch;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *favoriteItem;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, retain) NSMutableDictionary *listContent;
@property (nonatomic,strong) NSMutableArray *toList;

//Data
@property (nonatomic, strong) NSMutableDictionary *dictData;
@property (nonatomic,strong) NSMutableArray *marrXMLData;
@property (nonatomic,strong) NSMutableString *mstrXMLString;
@property (nonatomic,strong) NSMutableDictionary *mdictXMLPart;
@property (nonatomic,strong) NSString *url;

@end

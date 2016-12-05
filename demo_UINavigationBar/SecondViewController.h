//
//  SecondViewController.h
//  demo_UINavigationBar
//
//  Created by FCS on 12/4/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBarItem *tabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *secondMore;

@end

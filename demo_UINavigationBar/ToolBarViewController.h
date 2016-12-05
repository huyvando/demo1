//
//  ToolBarViewController.h
//  demo_UINavigationBar
//
//  Created by FCS on 12/4/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolBarViewController : UIViewController <UIToolbarDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)toolBarItem2:(id)sender;

- (IBAction)toolBarItem1:(id)sender;
@end

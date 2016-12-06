//
//  ShowContentViewController.h
//  demo_UINavigationBar
//
//  Created by FCS on 12/5/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIImageView *imgShow;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (nonatomic,strong) NSString *titleShow;
@property (nonatomic,strong) NSMutableArray *showData;

@end

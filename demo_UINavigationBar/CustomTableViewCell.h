//
//  CustomTableViewCell.h
//  demo_UINavigationBar
//
//  Created by FCS on 12/5/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblUpdate;
@end

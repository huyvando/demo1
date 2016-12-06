//
//  HeaderViewCell.h
//  demo_UINavigationBar
//
//  Created by FCS on 12/6/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *lblTitile;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;

@end

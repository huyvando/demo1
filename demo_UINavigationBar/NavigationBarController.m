//
//  NavigationBarController.m
//  demo_UINavigationBar
//
//  Created by FCS on 12/3/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import "NavigationBarController.h"

@interface NavigationBarController ()

@end

@implementation NavigationBarController
@synthesize listContent,toList,tableViewSearch,searchBar;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.title = @"Home";
    listContent = [[NSMutableArray alloc]initWithObjects:@"ONE",@"TWO",@"THREE",@"FOUR",@"FIVE",@"SIX",@"EIGHT",@"NINE",@"TEN",@"ONE-ONE",@"ONE-TWO",@"ONE-THREE",@"ONE-FOUR",@"ONE-FIVE",@"ONE-SIX", nil];
    self.favoriteItem.enabled = false;
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (toList && searchBar.text.length > 0) {
        return [toList count];
    }
    return [listContent count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    if(searchBar.text.length > 0) {
        cell.textLabel.text = [toList objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [listContent objectAtIndex:indexPath.row];
    }
    return cell;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES];
     self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self search];
    [self.searchBar setShowsCancelButton:YES];
    [tableViewSearch reloadData];

}
- (void) search {
    if(!toList){
        toList = [NSMutableArray array];
    }
    [toList removeAllObjects];
    NSString *searchText = self.searchBar.text;
    if(searchText.length > 0) {
        for( int i = 0; i < listContent.count; i++) {
            BOOL isFound = NO;
            if([[listContent objectAtIndex:i] length] > 0 && !isFound) {
                NSRange r = [[[listContent objectAtIndex:i] lowercaseString] rangeOfString:[searchText lowercaseString]];
                if(r.location != NSNotFound) {
                    isFound = YES;
                }
                if(isFound){
                    [toList addObject:[listContent objectAtIndex:i]];
                }
            }


        }
    }
    
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if(tabBar.selectedItem.tag == 1 ) {
        SecondViewController *sc = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:sc animated:NO];
    }
}
- (IBAction)ClickTo:(id)sender {
    SecondViewController *sc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:sc animated:YES];
}

@end

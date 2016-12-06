//
//  NavigationBarController.m
//  demo_UINavigationBar
//
//  Created by FCS on 12/3/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import "NavigationBarController.h"
#import "CustomTableViewCell.h"
#import "HeaderViewCell.h"
#import "ShowContentViewController.h"
#import "Define.h"
@interface NavigationBarController ()

@end

@implementation NavigationBarController
@synthesize listContent,toList,tableViewSearch,searchBar;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self startParsing];
    self.title = @"Home";
    self.favoriteItem.enabled = false;
    self.navigationItem.hidesBackButton = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [tap setEnabled:NO];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.tableViewSearch reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (toList && searchBar.text.length > 0) {
        return [toList count];
    }
    return [marrXMLData count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"CustomTableViewCell";
    static NSString *simpleTableHeader = @"HeaderViewCell";
    
    if(indexPath.row == 0) {
        HeaderViewCell *cell = (HeaderViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableHeader];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HeaderViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        listContent = [marrXMLData objectAtIndex:indexPath.row];
        //cell.lblTitle.text
        NSString *string = [listContent valueForKey:@"title"];
        NSString *string1 = [listContent valueForKey:@"media:thumbnail"];
        NSString *string2 = [listContent valueForKey:@"content"];
        //image
        NSString *strImgURLAsString = string1;
        [strImgURLAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *imgURL = [NSURL URLWithString:strImgURLAsString];
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:imgURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (!connectionError) {
                cell.headerImage.image  = [[UIImage alloc] initWithData:data];
            }else{
                NSLog(@"%@",connectionError);
            }
        }];
        cell.lblTitile.text = [Define replaceSpaceOfString:string];
        cell.lblContent.text = [Define replaceSpaceOfString:string2];
        return cell;
    } else {
        
        CustomTableViewCell *cell  = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        if(searchBar.text.length > 0) {
            cell.textLabel.text = [toList objectAtIndex:indexPath.row];
        } else {
            listContent = [marrXMLData objectAtIndex:indexPath.row];
            //cell.lblTitle.text
            NSString *string = [listContent valueForKey:@"title"];
            NSString *string1 = [listContent valueForKey:@"media:thumbnail"];
            NSString *string2 = [listContent valueForKey:@"content"];
            //image
            NSString *strImgURLAsString = string1;
            [strImgURLAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSURL *imgURL = [NSURL URLWithString:strImgURLAsString];
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:imgURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                if (!connectionError) {
                    cell.imgView.image  = [[UIImage alloc] initWithData:data];
                }else{
                    NSLog(@"%@",connectionError);
                }
            }];
            cell.lblUpdate.text = [Define replaceSpaceOfString:string2];
            cell.lblTitle.text = [Define replaceSpaceOfString:string];
            
        }
        return cell;
    }

}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return 250;
    }
    return 160;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowContentViewController *show = [[ShowContentViewController alloc]init];
    show.showData = [marrXMLData objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:show animated:YES];
    
}

//Search Bar
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES];
    //  self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self search];
    [self.searchBar setShowsCancelButton:YES];
    [tableViewSearch reloadData];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:NO];
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
    [tableViewSearch reloadData];
}
- (void) search {
    if(!toList){
        toList = [NSMutableArray array];
    }
    [toList removeAllObjects];
    
    NSMutableArray *arrayTable = [[NSMutableArray alloc] init];
        NSString *searchText = self.searchBar.text;
        if(searchText.length > 0) {
            for( int i = 0; i < marrXMLData.count; i++) {
                
                NSMutableArray *arrayData = [marrXMLData objectAtIndex:i];
                BOOL isFound = NO;
                NSString * content = [arrayTable valueForKey:@"content"];
                if([content length] > 0 && !isFound) {
                    NSRange r = [[[arrayTable valueForKey:@"content"] lowercaseString] rangeOfString:[searchText lowercaseString]];
                    if(r.location != NSNotFound) {
                        isFound = YES;
                    }
                    if(isFound){
                        [toList addObject:[arrayTable objectAtIndex:i]];
                    }
                }
    
    
            }
        }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.searchBar resignFirstResponder];
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
@synthesize marrXMLData;
@synthesize mstrXMLString;
@synthesize mdictXMLPart,url;

- (void)startParsing
{
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:xmlData];
    [xmlparser setDelegate:self];
    [xmlparser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if([elementName isEqualToString:@"rss"])
        marrXMLData = [[NSMutableArray alloc] init];
    if([elementName isEqualToString:@"item"])
        mdictXMLPart = [[NSMutableDictionary alloc] init];
    
    if ([elementName isEqualToString:@"media:thumbnail"]) {
        url = attributeDict[@"url"];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    if(!mstrXMLString)
        mstrXMLString = [[NSMutableString alloc] initWithString:string];
    else
        [mstrXMLString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    if([elementName isEqualToString:@"title"] || [elementName isEqualToString:@"pubDate"] || [elementName isEqualToString:@"content"] || [elementName isEqualToString:@"link"])
    {
        [mdictXMLPart setObject:mstrXMLString forKey:elementName];
    }
    if([elementName isEqualToString : @"media:thumbnail"] ) {
        [mdictXMLPart setValue:url forKey:elementName];
    }
    if([elementName isEqualToString:@"item"])
        [marrXMLData addObject:mdictXMLPart];
    mstrXMLString = nil;
}
@end

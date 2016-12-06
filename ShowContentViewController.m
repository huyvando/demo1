//
//  ShowContentViewController.m
//  demo_UINavigationBar
//
//  Created by FCS on 12/5/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import "ShowContentViewController.h"
#import "Define.h"
@interface ShowContentViewController ()

@end

@implementation ShowContentViewController
@synthesize showData;
- (void)viewDidLoad {
    [super viewDidLoad];
//    if(showData) {
//        NSString *title =  [Define replaceSpaceOfString:[showData valueForKey:@"title"]];
//        [self.headline setText:title];
//        if([self.headline.text length] > 100) {
//            self.headline.numberOfLines = 4;
//            CGRect currentFrame = self.headline.frame;
//            CGSize max = CGSizeMake(self.headline.frame.size.width, 500);
//            CGSize expected = [title sizeWithFont:self.headline.font constrainedToSize:max lineBreakMode:self.headline.lineBreakMode];
//            currentFrame.size.height = expected.height;
//            self.headline.frame = currentFrame;
//
//        }
//        NSString *media =  [Define replaceSpaceOfString:[showData valueForKey:@"media:thumbnail"]];
//        NSString *strImgURLAsString = media;
//        [strImgURLAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSURL *imgURL = [NSURL URLWithString:strImgURLAsString];
//        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:imgURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//            if (!connectionError) {
//                [self.imgShow setImage:[[UIImage alloc] initWithData:data]];
//            }else{
//                NSLog(@"%@",connectionError);
//            }
//        
//        }];
//        NSString *contentString = [Define replaceSpaceOfString:[showData valueForKey:@"content"]];
//       contentString = [contentString stringByAppendingString:[showData valueForKey:@"link"]];
//        [self.content setText:contentString];
//       
//    }
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:[Define replaceSpaceOfString:[showData valueForKey:@"link"]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
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

@end

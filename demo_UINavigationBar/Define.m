//
//  Define.m
//  demo_UINavigationBar
//
//  Created by FCS on 12/5/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import "Define.h"

@implementation Define

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//set replace value
+ (NSString *)replaceSpaceOfString:(NSString *)value {
    value =[value stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    value = [value stringByReplacingOccurrencesOfString:@"  " withString:@""];
    return value;
}

@end

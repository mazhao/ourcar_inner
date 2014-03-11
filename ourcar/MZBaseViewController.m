//
//  MZBaseViewController.m
//  ourcar
//
//  Created by mazhao on 14-3-10.
//  Copyright (c) 2014年 MZ. All rights reserved.
//

#import "MZBaseViewController.h"

@interface MZBaseViewController ()

@end

@implementation MZBaseViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:66.0/255.0
                                              green:69.0/255.0
                                               blue:71.0/255.0
                                              alpha:1.0]];
    

    UIColor * barColor = [UIColor colorWithRed:161.0/255.0
                                     green:164.0/255.0
                                      blue:166.0/255.0
                                     alpha:1.0];
    if([self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)]){
        [self.navigationController.navigationBar setBarTintColor:barColor];
    } else {
        [self.navigationController.navigationBar setTintColor:barColor];
    }
    
    NSDictionary *navBarTitleDict;
    UIColor * titleColor = [UIColor colorWithRed:55.0/255.0
                                           green:70.0/255.0
                                            blue:77.0/255.0
                                           alpha:1.0];
    navBarTitleDict = @{NSForegroundColorAttributeName:titleColor};
    [self.navigationController.navigationBar setTitleTextAttributes:navBarTitleDict];
    
    
    [self.view setBackgroundColor:[UIColor clearColor] ];
    
    if (OSVersionIsAtLeastiOS7()) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(contentSizeDidChangeNotification:)
                                                     name:UIContentSizeCategoryDidChangeNotification
                                                   object:Nil];
    }
    
}

- (void) contentSizeDidChangeNotification: (NSNotification*)notification
{
    [self contentSizeDidChange:notification.userInfo[UIContentSizeCategoryNewValueKey]];
}

-(void)contentSizeDidChange:(NSString *)size
{
    NSLog(@"content size did change with size of: %@", size);
}

@end

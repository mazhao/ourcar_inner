//
//  MZBaseNavigationController.m
//  ourcar
//
//  Created by mazhao on 14-3-10.
//  Copyright (c) 2014年 MZ. All rights reserved.
//

#import "MZBaseNavigationController.h"
#import "UIViewController+MMDrawerController.h"

@interface MZBaseNavigationController ()

@end

@implementation MZBaseNavigationController
-(UIStatusBarStyle)preferredStatusBarStyle{


    if(self.mm_drawerController.showsStatusBarBackgroundView){
        return UIStatusBarStyleLightContent;
    }
    else {
        return UIStatusBarStyleDefault;
    }
}
@end

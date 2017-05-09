//
//  ViewController.h
//  CountryInfo
//
//  Created by Arnel Perez on 09/05/2017.
//  Copyright © 2017 Arnel Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ViewController : UIViewController
{
    MBProgressHUD *HUB;
    NSMutableArray *resultArray;
}
@property (strong, nonatomic) NSMutableArray *resultArray;

@end

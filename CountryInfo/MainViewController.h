//
//  MainViewController.h
//  CountryInfo
//
//  Created by Arnel Perez on 09/05/2017.
//  Copyright © 2017 Arnel Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface MainViewController : UIViewController <UITableViewDelegate,
UITableViewDataSource, UISearchBarDelegate>
{
    MBProgressHUD *HUB;
    NSMutableArray *resultArray;
    IBOutlet UITableView *MIMtableView;
    IBOutlet UISearchBar *searchBar;
    NSMutableArray *displayObject;
}
@property (strong, nonatomic) NSMutableArray *resultArray;
@property (strong, nonatomic) NSMutableArray *displayObject;
@property (strong, nonatomic) IBOutlet UITableView *MIMtableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;


@end

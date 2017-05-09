//
//  MainTableViewCell.h
//  CountryInfo
//
//  Created by Arnel Perez on 09/05/2017.
//  Copyright © 2017 Arnel Perez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblCountryName;
    IBOutlet UIImageView *imgFlag;
}

@property (strong, nonatomic) IBOutlet UILabel *lblCountryName;
@property (strong, nonatomic) IBOutlet UIImageView *imgFlag;

@end

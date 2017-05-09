//
//  InfoViewController.h
//  CountryInfo
//
//  Created by Arnel Perez on 09/05/2017.
//  Copyright © 2017 Arnel Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface InfoViewController : UIViewController <MKMapViewDelegate>
{
    NSMutableDictionary *jsonData;
    IBOutlet UILabel *lblCountryName;
    IBOutlet UIImageView *imgFlag;
    IBOutlet UILabel *lblCapital;
    IBOutlet UILabel *lblCurrency;
    IBOutlet UILabel *lblCountryCode;
    IBOutlet UILabel *lblDemonym;
    IBOutlet UILabel *lblPopulation;
    
    double coordinateX;
    double coordinateY;
    IBOutlet MKMapView* mapView;
}

@property (strong, nonatomic) NSMutableDictionary *jsonData;
@property (strong, nonatomic) IBOutlet UILabel *lblCountryName;
@property (strong, nonatomic) IBOutlet UIImageView *imgFlag;
@property (strong, nonatomic) IBOutlet UILabel *lblCapital;
@property (strong, nonatomic) IBOutlet UILabel *lblCurrency;
@property (strong, nonatomic) IBOutlet UILabel *lblCountryCode;
@property (strong, nonatomic) IBOutlet UILabel *lblDemonym;
@property (strong, nonatomic) IBOutlet UILabel *lblPopulation;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)btnBack:(id)sender;
- (IBAction)btnOpenMap:(id)sender;

@end

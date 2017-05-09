//
//  InfoViewController.m
//  CountryInfo
//
//  Created by Arnel Perez on 09/05/2017.
//  Copyright © 2017 Arnel Perez. All rights reserved.
//

#import "InfoViewController.h"
#import "MyAnnotation.h"

@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize jsonData,lblCountryName,imgFlag;
@synthesize lblCapital,lblDemonym,lblCurrency,lblPopulation,lblCountryCode;
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%@",jsonData);

    NSString *alpha2Code = [jsonData objectForKey:@"alpha2Code"];
    imgFlag.image = [UIImage imageNamed:alpha2Code];
    
    lblCountryName.text = [jsonData objectForKey:@"name"];
    lblCountryCode.text = [NSString stringWithFormat:@"%@",[[jsonData objectForKey:@"callingCodes"]objectAtIndex:0]];
    lblCapital.text = [jsonData objectForKey:@"capital"];
    lblDemonym.text = [jsonData objectForKey:@"demonym"];
    lblPopulation.text = [NSString stringWithFormat:@"%@",[jsonData objectForKey:@"population"]];
    
    NSMutableArray *arrayCurrencies = [jsonData objectForKey:@"currencies"];
    NSMutableDictionary *dictCurrencies = [arrayCurrencies objectAtIndex:0];
    NSString *code = [dictCurrencies objectForKey:@"code"];
    NSString *name = [dictCurrencies objectForKey:@"name"];
    NSString *symbol = [dictCurrencies objectForKey:@"symbol"];
    lblCurrency.text = [NSString stringWithFormat:@"%@: %@ (%@)",symbol,name,code];
    
    self.mapView.delegate=self;
    [self showMapLocation];
}

-(void) showMapLocation {
    double dlatitude  = [[[jsonData objectForKey:@"latlng"]objectAtIndex:0]doubleValue];
    double dlongtitude  = [[[jsonData objectForKey:@"latlng"]objectAtIndex:1]doubleValue];
    
    coordinateX = dlatitude;
    coordinateY = dlongtitude;
    
    mapView.showsUserLocation = YES;
    
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = coordinateX;
    theCoordinate.longitude = coordinateY;
    
    MyAnnotation* myAnnotation=[[MyAnnotation alloc] init];
    myAnnotation.coordinate=theCoordinate;
    myAnnotation.title =[jsonData objectForKey:@"name"];
    myAnnotation.subtitle = [NSString stringWithFormat:@"%f, %f",dlatitude,dlongtitude];
    
    [mapView addAnnotation:myAnnotation];
    
    MKMapRect flyTo = MKMapRectNull;
    
    MKMapPoint annotationPoint = MKMapPointForCoordinate(myAnnotation.coordinate);
    MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
    if (MKMapRectIsNull(flyTo)) {
        flyTo = pointRect;
    }
    else {
        flyTo = MKMapRectUnion(flyTo, pointRect);
    }
    
    // Position the map so that all overlays and annotations are visible on screen.
    mapView.visibleMapRect = flyTo;
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    region.center=mapView.region.center;
    span.latitudeDelta=10;
    span.longitudeDelta=10;
    region.span=span;
    [mapView setRegion:region animated:TRUE];
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

- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnOpenMap:(id)sender {
    NSString* directionsURL = [NSString stringWithFormat:@"http://maps.apple.com/?ll=%f,%f&z=5", coordinateX, coordinateY];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: directionsURL]];
}
@end

//
//  ViewController.m
//  CountryInfo
//
//  Created by Arnel Perez on 09/05/2017.
//  Copyright © 2017 Arnel Perez. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize resultArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    HUB = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUB];
    [HUB showWhileExecuting:@selector(callWebservice) onTarget:self withObject:nil animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callWebservice {
    NSString * strPortalURL = @"https://restcountries.eu/rest/v2/all";
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:strPortalURL]];
    request.HTTPMethod = @"GET";
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * urlData = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
    if (!error) {
        NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"responseData: %@",responseData);
        resultArray = [[NSMutableArray alloc] init];
        resultArray = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:nil];
        MainViewController *mvc = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:[NSBundle mainBundle]];
        mvc.resultArray = resultArray;

        [self.navigationController setNavigationBarHidden:YES];
        [self.navigationController pushViewController:mvc animated:YES];
        
    }
    else{
        //Error handling here
    }
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

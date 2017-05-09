//
//  MainViewController.m
//  CountryInfo
//
//  Created by Arnel Perez on 09/05/2017.
//  Copyright © 2017 Arnel Perez. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "InfoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize resultArray, MIMtableView, searchBar, displayObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    displayObject = [[NSMutableArray alloc] init];
    displayObject = resultArray;
    [MIMtableView reloadData];
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [displayObject count];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *jsonData = [displayObject objectAtIndex:indexPath.section];
    
    static NSString *simpleTableIdentifier = @"Cell";
    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MainTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSString *countryName = [jsonData objectForKey:@"name"];
    NSString *alpha2Code = [jsonData objectForKey:@"alpha2Code"];
    
    cell.lblCountryName.text = countryName;
    cell.imgFlag.image = [UIImage imageNamed:alpha2Code];
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableDictionary *jsonData = [displayObject objectAtIndex:indexPath.section];
    
    InfoViewController *infoVC = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:[NSBundle mainBundle]];
    infoVC.jsonData = jsonData;
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController pushViewController:infoVC animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText length] == 0) {
        displayObject = [[NSMutableArray alloc] init];
        [displayObject addObjectsFromArray:resultArray];
    }
    else
    {
        displayObject = [[NSMutableArray alloc] init];
        for(NSMutableDictionary * jsonData in resultArray)
        {
            NSString *string = [jsonData objectForKey:@"name"];
            NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(r.location != NSNotFound) {
                [displayObject addObject:jsonData];
            }
        }
    }
    [MIMtableView reloadData];
}

@end

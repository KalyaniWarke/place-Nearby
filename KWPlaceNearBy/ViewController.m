//
//  ViewController.m
//  KWPlaceNearBy
//
//  Created by Kalyani on 21/10/16.
//  Copyright © 2016 kalyani warke. All rights reserved.
//

#import "ViewController.h"
#import "PlaceListViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    placeTypes=@[@"atm",@"bakery",@"cafe",@"doctor",@"food",@"gas_station",@"hospital",@"jewelry_store",@"library",@"movie_theater",@"park",@"school"];
}
//https://maps.googleapis.com/maps/api/place/nearbysearch/json?&key=AIzaSyDCfBRM3nl0TkHxetMvJU56YwlaEtIzm9c&location=19.34,72.45&radius=50000&types=atm|bakery|
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return placeTypes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text= [placeTypes objectAtIndex:indexPath.row];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *placeType =[placeTypes objectAtIndex:indexPath.row];
    PlaceListViewController *placeListViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"PlaceListViewController"];
    placeListViewController.selectedPlaceType =placeType;
    [self.navigationController pushViewController:placeListViewController animated:YES];
    
}



@end

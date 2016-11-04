//
//  ViewController.h
//  KWPlaceNearBy
//
//  Created by Kalyani on 21/10/16.
//  Copyright © 2016 kalyani warke. All rights reserved.
//
#define kPlaceAPIKey @"AIzaSyDCfBRM3nl0TkHxetMvJU56YwlaEtIzm9c"
#define kLatitude 18.516726
#define kLongitude 73.856255
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *placeTypes;
}
@property (weak, nonatomic) IBOutlet UITableView *tableViewPlaceType;

@end


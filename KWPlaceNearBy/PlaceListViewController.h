//
//  PlaceListViewController.h
//  KWPlaceNearBy
//
//  Created by Kalyani on 21/10/16.
//  Copyright © 2016 kalyani warke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>
{
    NSMutableArray *placeList;
    NSXMLParser *parser;
    NSString *dataString;
    NSMutableDictionary *placeDictionary;
}
@property NSString *selectedPlaceType;

@property (weak, nonatomic) IBOutlet UITableView *tableViewPlaceList;


@end

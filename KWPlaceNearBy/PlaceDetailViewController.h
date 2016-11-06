//
//  PlaceDetailViewController.h
//  KWPlaceNearBy
//
//  Created by Kalyani on 01/11/16.
//  Copyright © 2016 kalyani warke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface PlaceDetailViewController : UIViewController<MKMapViewDelegate,NSXMLParserDelegate>
{
    
    NSXMLParser *parser;
    NSMutableDictionary *placeDetailDictionary;
    NSString *detailDataString;
    NSMutableArray *placeDetailList;
}


@property NSString *selectedPlaceID;
@property (strong, nonatomic) IBOutlet UILabel *labelOpenClose;

@property (strong, nonatomic) IBOutlet UILabel *labelAddress;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelcall;

@end

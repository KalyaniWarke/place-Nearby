//
//  PlaceDetailViewController.m
//  KWPlaceNearBy
//
//  Created by Kalyani on 01/11/16.
//  Copyright © 2016 kalyani warke. All rights reserved.
//

#import "PlaceDetailViewController.h"
#import "ViewController.h"

@interface PlaceDetailViewController ()

@end

@implementation PlaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self getPlaceListDetailsWithAPIKey:kPlaceAPIKey placeID:self.selectedPlaceID];
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

-(void)getPlaceListDetailsWithAPIKey:(NSString *)key
                             placeID:(NSString *)placeID
{
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/details/xml?&key=%@&placeid=%@",key,placeID];
    
    
    NSLog(@"%@",urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *task = [mySession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            //alert
        }
        else {
            
            if (response) {
                
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                
                if (httpResponse.statusCode == 200) {
                    
                    if (data) {
                        
                        //xml parsing
                        
                        parser = [[NSXMLParser alloc]initWithData:data];
                        parser.delegate = self;
                        [parser parse];
                        
                    }
                    else {
                        
                        
                    }
                }
                else {
                    //alert
                   
                    
                }
                
            }
            else {
                //alert
               
                
            }
        }
        
        
    }];
    
    
    [task resume];
    
}



-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    
    if ([elementName isEqualToString:@"result"]) {
        placeDetailDictionary = [[NSMutableDictionary alloc]init];
        
    }
    else if ([elementName isEqualToString:@"name"]) {
        detailDataString = [[NSMutableString alloc]init];
        
    }
    else if ([elementName isEqualToString:@"vicinity"]) {
        detailDataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"formatted_phone_number"]) {
        detailDataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"author_name"]) {
        detailDataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"time"]) {
        detailDataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"text"]) {
        detailDataString = [[NSMutableString alloc]init];
    }
    
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    detailDataString = string;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"result"]) {
        
        [placeDetailList addObject:placeDetailDictionary];
        
        
        
       
        NSLog(@"%@",placeDetailDictionary);
        
        NSLog(@"%@",placeDetailList);
        
        
    }
    else if ([elementName isEqualToString:@"name"]) {
        
        [placeDetailDictionary setValue:detailDataString forKey:@"name"];
    }
    else if ([elementName isEqualToString:@"vicinity"]) {
        
        [placeDetailDictionary setValue:detailDataString forKey:@"vicinity"];
        
    }
    else if ([elementName isEqualToString:@"formatted_phone_number"]) {
        
        [placeDetailDictionary setValue:detailDataString forKey:@"formatted_phone_number"];
    }
    
    else if ([elementName isEqualToString:@"author_name"]) {
        
        [placeDetailDictionary setValue:detailDataString forKey:@"author_name"];
        
    }
    else if ([elementName isEqualToString:@"time"]) {
        
        [placeDetailDictionary setValue:detailDataString forKey:@"time"];
        
    }
    else if ([elementName isEqualToString:@"text"]) {
        
        [placeDetailDictionary setValue:detailDataString forKey:@"text"];
        
    }
    
    else if([elementName isEqualToString:@"PlaceDetailsResponse"]){
        
       
        
        
//        [self performSelectorOnMainThread:@selector(updateTableView) withObject:nil waitUntilDone:NO];
        
    }
    
    
    
    _labelName.text = [placeDetailDictionary valueForKey:@"name"];
    
    _labelAddress.text = [placeDetailDictionary valueForKey:@"vicinity"];
    
    _labelcall.text = [placeDetailDictionary valueForKey:@"formatted_phone_number"];
    
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"PARSE ERROR : %@",parseError.localizedDescription);
}

@end

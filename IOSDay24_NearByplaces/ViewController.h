//
//  ViewController.h
//  IOSDay24_NearByplaces
//
//  Created by Student P_10 on 31/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SecondViewController.h"

@interface ViewController : UIViewController<MKMapViewDelegate,UITextFieldDelegate>

//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&key=AIzaSyBsWiGt8ziCFsk-CSEh27f3kShaAelvUWw
//https://maps.googleapis.com/maps/api/place/nearbysearch/json?
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
@property (strong, nonatomic) IBOutlet UITextField *myText;
//-(IBAction)myCurrentLocation:(UIButton *)sender;

- (IBAction)nextButton:(UIButton *)sender;
@property double lati;
@property double longi;

@end


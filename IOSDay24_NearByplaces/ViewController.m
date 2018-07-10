//
//  ViewController.m
//  IOSDay24_NearByplaces
//
//  Created by Student P_10 on 31/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myText.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(bool)textFieldShouldReturn:(UITextField *)textField
{
    static MKPlacemark *oldPlace;
    NSString *location=self.myText.text;
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
     {
         if (placemarks && placemarks.count>0)
         {
             if(oldPlace !=nil)
             {
                 [self.myMapView removeAnnotation:oldPlace];
             }
             CLPlacemark *topResults=[placemarks objectAtIndex:0];
             MKPlacemark *placemark=[[MKPlacemark alloc]initWithPlacemark:topResults];
             MKCoordinateRegion region=self.myMapView.region;
             region.center=placemark.region.center;
             region.span.longitudeDelta=2;
             region.span.latitudeDelta=2;
             NSLog(@"Latitude=%f and Longitude=%f",region.center.latitude,region.center.longitude);
             self.lati=region.center.latitude;
             self.longi=region.center.longitude;
             [self.myMapView setRegion:region animated:YES];
             [self.myMapView addAnnotation:placemark];
             oldPlace=placemark;
             
         }
     }
     ];
    [textField resignFirstResponder];
    return YES;
    
}

- (IBAction)nextButton:(UIButton *)sender
{
    SecondViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    nvc.latii=self.lati;
    nvc.longii=self.longi;
    [self.navigationController pushViewController:nvc animated:YES];
    
}
@end

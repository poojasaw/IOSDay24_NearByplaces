//
//  FourthViewController.h
//  IOSDay24_NearByplaces
//
//  Created by Student P_10 on 19/06/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "ViewController.h"

@interface FourthViewController : UIViewController

//@property NSMutableArray *totalArray;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property double latitude;
@property double longitude;
//@property NSMutableArray *vicinity;
//@property NSString *finalTypeString;
@property NSString *addressString;
- (IBAction)backButton:(UIButton *)sender;

@end

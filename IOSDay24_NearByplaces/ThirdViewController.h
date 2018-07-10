//
//  ThirdViewController.h
//  IOSDay24_NearByplaces
//
//  Created by Student P_10 on 31/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FourthViewController.h"

@interface ThirdViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myThirdView;
@property double latiii;
@property double longiii;
@property NSString *typeString;
//@property NSMutableArray *namesArray,*addressArray;
@property NSMutableArray *iconArray, *idArray, *nameArray, *placeIdArray;

@property NSMutableArray *resultArray;

@property NSMutableArray *addressArray;


@end

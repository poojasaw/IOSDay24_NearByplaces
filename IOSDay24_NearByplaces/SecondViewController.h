//
//  SecondViewController.h
//  IOSDay24_NearByplaces
//
//  Created by Student P_10 on 31/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdViewController.h"

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *displayList;

@property double latii;
@property double longii;
@end

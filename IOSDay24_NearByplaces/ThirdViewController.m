//
//  ThirdViewController.m
//  IOSDay24_NearByplaces
//
//  Created by Student P_10 on 31/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.namesArray = [[NSMutableArray alloc]init];
   // self.addressArray=[[NSMutableArray alloc]init];
    
    self.iconArray = [[NSMutableArray alloc]init];
    self.idArray = [[NSMutableArray alloc]init];
    self.nameArray = [[NSMutableArray alloc]init];
    self.placeIdArray = [[NSMutableArray alloc]init];
    self.addressArray=[[NSMutableArray alloc]init];
    self.myThirdView.delegate=self;
    self.myThirdView.dataSource=self;
    double radius=1500;

NSString *str1= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f &radius=%f&type=%@&key=AIzaSyBsWiGt8ziCFsk-CSEh27f3kShaAelvUWw", self.latiii, self.longiii, radius, self.typeString];
    str1 = [str1  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

NSLog(@"the url: %@",str1);
    NSURL *url = [[NSURL alloc]initWithString:str1];
NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *myResponse = (NSHTTPURLResponse *)response;
        if(myResponse.statusCode == 200)
        {
            NSLog(@"Response Found");
            if(data)
            {
NSDictionary *outerDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
NSArray *resultsArray = [outerDict valueForKey:@"results"];
    for(NSDictionary *tempDict in resultsArray)
        {
//NSDictionary *geometryDict = [tempDict valueForKey:@"geometry"];
NSString *icon = [tempDict valueForKey:@"icon"];
[self.iconArray addObject:icon];
NSString *id1 = [tempDict valueForKey:@"id"];
[self.idArray addObject:id1];
NSString *name = [tempDict valueForKey:@"name"];
[self.nameArray addObject:name];
NSString *placeId = [tempDict valueForKey:@"place_id"];
[self.placeIdArray addObject:placeId];
NSString *vicinity = [tempDict valueForKey:@"vicinity"];
[self.addressArray addObject:vicinity];
        }
NSLog(@"Icon Array: %@", self.iconArray);
NSLog(@"Id Array: %@", self.idArray);
NSLog(@"Name Array: %@", self.nameArray);
NSLog(@"Place Id Array: %@", self.placeIdArray);
NSLog(@"Address Array:%@",self.addressArray);
if(self.placeIdArray.count>0)
{
[self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
                }
            }
            else
            {
                NSLog(@"Data not Found");
            }
        }
        
        NSLog(@"%@", self.placeIdArray);

        
    }];

    
    [dataTask resume];
    
    // Do any additional setup after loading the view.
}

-(void)updateUI
{
    [self.myThirdView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.nameArray objectAtIndex:indexPath.row];
   // cell.detailTextLabel.text=[self.finalList objectAtIndex:indexPath.row];
    return cell;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.myThirdView reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
     FourthViewController *wvc=[self.storyboard instantiateViewControllerWithIdentifier:@"FourthViewController"];
    wvc.latitude=self.latiii;
    wvc.longitude=self.longiii;
    wvc.addressString=cell.textLabel.text;
   wvc.addressString=[self.addressArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:wvc animated:YES];
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

    @end

    

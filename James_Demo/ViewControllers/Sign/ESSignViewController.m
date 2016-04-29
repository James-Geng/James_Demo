//
//  ESSignViewController.m
//  James_Demo
//
//  Created by sycf_ios on 16/4/29.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ESSignViewController.h"
#import "ESSignRecordSingleImageTableViewCell.h"

@interface ESSignViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) ESSignRecordSingleImageTableViewCell *mySignRecordSingleImageTestCell;

@end

@implementation ESSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"ESSignRecordSingleImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"ESSignRecordSingleImageTableViewCell"];
    self.mySignRecordSingleImageTestCell = [self.myTableView dequeueReusableCellWithIdentifier:@"ESSignRecordSingleImageTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate/Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (_myTableViewDataArray.count>0) {
//        
//        return _myTableViewDataArray.count;
//    }
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    static NSString *reuseIdentifierSingleImage = @"ESSignRecordSingleImageTableViewCell";
    
    ESSignRecordSingleImageTableViewCell *signRecordSingleImageCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierSingleImage];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    
    NSString *imageUrl = @"http://image_url.com";
    
    if (indexPath.row % 2 == 0) {
        
        imageUrl = nil;
    }
    
    [signRecordSingleImageCell setUpDataWithTitle:@"嗨起，坚持的力量让我觉得美好！#100早起# 嗨起，坚持的力量让我觉得美好！#100早起#" dateString:@"12.07" timeString:@"12:30" signDayNumber:@"坚持2天" imageUrl:imageUrl];
    
    return signRecordSingleImageCell;
    /*
    cell.textLabel.text = @"EXO";
    
    return cell;
     */
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat height = 0;
    
    NSString *imageUrl = @"http://image_url.com";
    
    if (indexPath.row % 2 == 0) {
        
        imageUrl = nil;
    }
    
    [self.mySignRecordSingleImageTestCell setUpDataWithTitle:@"嗨起，坚持的力量让我觉得美好！#100早起# 嗨起，坚持的力量让我觉得美好！#100早起#" dateString:@"12.07" timeString:@"12:30" signDayNumber:@"坚持2天" imageUrl:imageUrl];
    
    NSString *myWeiboAttitudeTestCellHeight = [NSString stringWithFormat:@"%@",@([self.mySignRecordSingleImageTestCell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize].height+1)];
    
    height =  myWeiboAttitudeTestCellHeight.floatValue;
    /*
    if ([_myTableViewCellHeightArray count]>indexPath.row) {
        
        [_myTableViewCellHeightArray replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithFloat:height]];
    }
    */
    return height;
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

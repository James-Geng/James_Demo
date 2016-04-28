//
//  ViewController.m
//  James_Demo
//
//  Created by sycf_ios on 16/4/22.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ViewController.h"
#import "WQCalendarLogic.h"
#import "WQDraggableCalendarView.h"
#import "ESSelectedDateAlertView.h"
#import "ESSignCalendarStatisticsViewController.h"

@interface ViewController ()<ESSelectedDateAlertViewDelegate>

@property (nonatomic, strong) WQDraggableCalendarView *calendarView;
@property (nonatomic, strong) WQCalendarLogic *calendarLogic;

@property (weak, nonatomic) IBOutlet UILabel *myDateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setTranslucent:NO];
    
    self.calendarLogic = [[WQCalendarLogic alloc] init];
    
    [self showCalendar];
}

- (IBAction)buttonDidPress:(id)sender {
    
    ESSelectedDateAlertView *selectedDateAlertView = [[ESSelectedDateAlertView alloc] init];
    selectedDateAlertView.delegate = self;
    
    [selectedDateAlertView showInView:[UIApplication sharedApplication].keyWindow withFrame:[UIScreen mainScreen].bounds];
}

- (IBAction)calendarStatisticsPushDidPress:(id)sender {
    
    ESSignCalendarStatisticsViewController *signCSViewController = [[ESSignCalendarStatisticsViewController alloc] initWithNibName:@"ESSignCalendarStatisticsViewController" bundle:nil];
    
    [self.navigationController pushViewController:signCSViewController animated:YES];
}

- (void)showCalendar
{
    CGRect calendarRect = self.view.bounds;
    calendarRect.origin.y += 152, calendarRect.size.height -= 52;
    self.calendarView = [[WQDraggableCalendarView alloc] initWithFrame:calendarRect];
    //self.calendarView.draggble = NO;
    
    [self.view addSubview:self.calendarView];
    
    self.calendarView.backgroundColor = [UIColor clearColor];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYYMMdd";
    
    NSDate *myDate = [formatter dateFromString:@"20160422"];
    
    [self.calendarLogic reloadCalendarView:self.calendarView withDate:myDate];
    
    //self.calendarLogic.selectedDate = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*3];
    /*
    CGRect scrollRect = self.view.bounds;
    scrollRect.origin.y = 400;
    scrollRect.size.height = 40;
    self.scrollCalendarView = [[WQScrollCalendarWrapperView alloc] initWithFrame:scrollRect];
    self.scrollCalendarView.backgroundColor = [UIColor greenColor];
    self.scrollCalendarView.delegate = self;
    [self.view addSubview:self.scrollCalendarView];
    [self.scrollCalendarView reloadData];
    */
}

#pragma mark ESSelectedDateAlertViewDelegate

-(void)ESSelectedDateAlertView:(ESSelectedDateAlertView *)ESSelectedDateAlertView closeViewWithSelectedDate:(NSDate *)selectedDate
{
    NSLog(@"selected date = %@",selectedDate);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY年MM月dd日";
    
    self.myDateLabel.text = [formatter stringFromDate:selectedDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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

@interface ViewController ()

@property (nonatomic, strong) WQDraggableCalendarView *calendarView;
@property (nonatomic, strong) WQCalendarLogic *calendarLogic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.calendarLogic = [[WQCalendarLogic alloc] init];
    
    [self showCalendar];
}

- (IBAction)buttonDidPress:(id)sender {
    
    ESSelectedDateAlertView *selectedDateAlertView = [[ESSelectedDateAlertView alloc] init];
    selectedDateAlertView.delegate = self;
    
    [selectedDateAlertView showInView:[UIApplication sharedApplication].keyWindow withFrame:[UIScreen mainScreen].bounds];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ESSignCalendarStatisticsViewController.m
//  James_Demo
//
//  Created by sycf_ios on 16/4/28.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ESSignCalendarStatisticsViewController.h"
#import "WQCalendarLogic.h"
#import "WQDraggableCalendarView.h"

@interface ESSignCalendarStatisticsViewController ()<WQCalendarLogicDelegate>

@property (weak, nonatomic) IBOutlet UIView *myTopContentView;
@property (weak, nonatomic) IBOutlet UILabel *myDateTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *myLeftArrowButton;
@property (weak, nonatomic) IBOutlet UIButton *myRightArrowButton;
@property (weak, nonatomic) IBOutlet UIView *myCalendarView;
@property (weak, nonatomic) IBOutlet UILabel *myBottomDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myBottomIconImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myCalendarViewHeightConstraint;


@property (nonatomic, strong) WQDraggableCalendarView *calendarView;
@property (nonatomic, strong) WQCalendarLogic *calendarLogic;

@end

@implementation ESSignCalendarStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"日历统计";
    
    [self.navigationController.navigationBar setTranslucent:NO];
    
    [self commonInit];
}

-(void)commonInit
{
    self.calendarLogic = [[WQCalendarLogic alloc] init];
    self.calendarLogic.delegate = self;
    
    CGRect calendarRect = self.myCalendarView.bounds;
    //calendarRect.origin.y += 152, calendarRect.size.height -= 52;
    self.calendarView = [[WQDraggableCalendarView alloc] initWithFrame:calendarRect];
    //self.calendarView.draggble = NO;
    self.calendarView.gridView.autoResize = YES;
    self.calendarView.gridView.calendarGridType = WQCalendarGridStatistics;
    
    [self.myCalendarView addSubview:self.calendarView];
    
    NSDate *today = [[NSDate alloc] init];
    
    [self.calendarLogic reloadCalendarView:self.calendarView withDate:today];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY年MM月dd日";
    
    self.myDateTitleLabel.text = [dateFormatter stringFromDate:[[NSDate alloc] init]];
    
    NSDateComponents *dateComponents = [today YMDComponents];
    
    NSLog(@"dateComponents = %@",dateComponents);
    
    _myCurrentMonth = dateComponents.month;
    
    _myCurrentYear = dateComponents.year;
    
    self.myRightArrowButton.userInteractionEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myLeftArrowButtonDidPress:(id)sender {
    
    [self.calendarLogic goToPreviousMonthInCalendarView:self.calendarView];
    self.myDateTitleLabel.text = [NSString stringWithFormat:@"%lu年%lu月%lu日", (unsigned long)self.calendarLogic.selectedCalendarDay.year, (unsigned long)self.calendarLogic.selectedCalendarDay.month, (unsigned long)self.calendarLogic.selectedCalendarDay.day];
    
    [self commonHiddenRightArrowButton];
}

- (IBAction)myRightArrowButtonDidPress:(id)sender {
    
    [self.calendarLogic goToNextMonthInCalendarView:self.calendarView];
    self.myDateTitleLabel.text = [NSString stringWithFormat:@"%lu年%lu月%lu日", (unsigned long)self.calendarLogic.selectedCalendarDay.year, (unsigned long)self.calendarLogic.selectedCalendarDay.month, (unsigned long)self.calendarLogic.selectedCalendarDay.day];
    
    [self commonHiddenRightArrowButton];
}

-(void)commonHiddenRightArrowButton
{
    if ([self isMoreThanCurrentMonthWithSelectedCalendarDay:self.calendarLogic.selectedCalendarDay]) {
        
        self.myRightArrowButton.userInteractionEnabled = NO;
    }
    else
    {
        self.myRightArrowButton.userInteractionEnabled = YES;
    }
}

-(BOOL)isMoreThanCurrentMonthWithSelectedCalendarDay:(WQCalendarDay *) selectedCalendarDay
{
    NSInteger month = selectedCalendarDay.month;
    
    NSInteger year = selectedCalendarDay.year;
    
    if (month >= _myCurrentMonth && year >= _myCurrentYear) {
        
        return YES;
    }
    
    return NO;
}

#pragma mark WQCalendarLogicDelegate

-(void)WQCalendarLogic:(WQCalendarLogic *)WQCalendarLogic WQCalendarGridView:(WQCalendarGridView *)WQCalendarGridView autoResizeHeight:(CGFloat)height
{
    self.myCalendarViewHeightConstraint.constant = height;
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

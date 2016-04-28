//
//  ESSelectedDateAlertView.h
//  James_Demo
//
//  Created by sycf_ios on 16/4/26.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQCalendarLogic.h"
#import "WQDraggableCalendarView.h"

@protocol ESSelectedDateAlertViewDelegate;

@interface ESSelectedDateAlertView : UIView
{
    NSInteger _myCurrentMonth;
    NSInteger _myCurrentYear;
}

@property (weak, nonatomic) IBOutlet UIView *alphaView;
@property (weak, nonatomic) IBOutlet UIView *myPickerContentView;
@property (weak, nonatomic) IBOutlet UIButton *myCloseButton;
@property (weak, nonatomic) IBOutlet UIView *myDateLabelContentView;
@property (weak, nonatomic) IBOutlet UILabel *myDateTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *myLeftArrowButton;
@property (weak, nonatomic) IBOutlet UIButton *myRightArrowButton;
@property (weak, nonatomic) IBOutlet UIView *myCustomDatePickerView;

@property (nonatomic, strong) WQDraggableCalendarView *calendarView;
@property (nonatomic, strong) WQCalendarLogic *calendarLogic;

@property (weak) id delegate;

-(void)closeViewWithAnimate:(BOOL) animate;

-(void)showInView:(UIView *)view withFrame:(CGRect)frame;

@end

@protocol ESSelectedDateAlertViewDelegate

-(void)ESSelectedDateAlertView:(ESSelectedDateAlertView *) ESSelectedDateAlertView closeViewWithSelectedDate:(NSDate *) selectedDate;

@end

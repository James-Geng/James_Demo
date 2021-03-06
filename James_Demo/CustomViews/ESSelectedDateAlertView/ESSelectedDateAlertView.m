//
//  ESSelectedDateAlertView.m
//  James_Demo
//
//  Created by sycf_ios on 16/4/26.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ESSelectedDateAlertView.h"

@implementation ESSelectedDateAlertView

-(id)init{
    self = [[[NSBundle mainBundle] loadNibNamed:@"ESSelectedDateAlertView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        //self.frame = frame;
    
        [self commonInit];
    }
    return self;
}

-(void)commonInit
{
    self.calendarLogic = [[WQCalendarLogic alloc] init];
    
    self.calendarLogic.delegate = self;
    
    CGRect calendarRect = self.myCustomDatePickerView.bounds;
    //calendarRect.origin.y += 152, calendarRect.size.height -= 52;
    self.calendarView = [[WQDraggableCalendarView alloc] initWithFrame:calendarRect];
    //self.calendarView.draggble = NO;
    self.calendarView.gridView.autoResize = YES;
    
    [self.myCustomDatePickerView addSubview:self.calendarView];
    
    //self.calendarView.backgroundColor = [UIColor lightGrayColor];
    
    //NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //formatter.dateFormat = @"YYYYMMdd";
    
    //NSDate *myDate = [formatter dateFromString:@"20160422"];
    
    NSDate *today = [[NSDate alloc] init];
    
    [self.calendarLogic reloadCalendarView:self.calendarView withDate:today];
    
    NSDateComponents *dateComponents = [today YMDComponents];
    
    NSLog(@"dateComponents = %@",dateComponents);
    
    _myCurrentMonth = dateComponents.month;
    
    _myCurrentYear = dateComponents.year;
    
    self.myLeftArrowButton.userInteractionEnabled = NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.alphaView.layer.opacity = 0;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY年MM月dd日";
    
    self.myDateTitleLabel.text = [dateFormatter stringFromDate:[[NSDate alloc] init]];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint  point = [[touches anyObject] locationInView:self];
    UIView * view = [self hitTest:point withEvent:event];
    if (view.tag == 1) {
        return ;
    }
    
    [self closeViewWithAnimate:YES];
}

-(void)closeViewWithAnimate:(BOOL) animate{
    
    if (_delegate && [_delegate respondsToSelector:@selector(ESSelectedDateAlertView:closeViewWithSelectedDate:)]) {
        [_delegate ESSelectedDateAlertView:self closeViewWithSelectedDate:_calendarLogic.selectedDate];
    }
    
    CGFloat duration = 0.3f;
    if (animate) {
        duration = 0;
    }
    
    [UIView animateWithDuration:duration animations:^{
        self.alphaView.layer.opacity = 0;
        //self.myHeight.constant = 0;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
-(void)showInView:(UIView *)view withFrame:(CGRect)frame{
    self.frame = frame;
    if (view) {
        
        [view addSubview:self];
        [UIView animateWithDuration:0.3 animations:^{
            self.alphaView.layer.opacity = 1;;
            //self.myHeight.constant = 224;
            //            [self setNeedsLayout];
            //            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.2 animations:^{
                /*
                 CGFloat height = self.myCollection.contentSize.height ;
                 if (height < 224) {
                 self.myHeight.constant = height;
                 [self setNeedsLayout];
                 [self layoutIfNeeded];
                 }*/
                //                [self setNeedsLayout];
                //                [self layoutIfNeeded];
            }];
        }];
    }
}

- (IBAction)myCloseButtonDidPress:(id)sender {
    
    [self closeViewWithAnimate:YES];
}

- (IBAction)myLeftArrowPreviousButtonDidPress:(id)sender {
    
    [self.calendarLogic goToPreviousMonthInCalendarView:self.calendarView];
    self.myDateTitleLabel.text = [NSString stringWithFormat:@"%lu年%lu月%lu日", (unsigned long)self.calendarLogic.selectedCalendarDay.year, (unsigned long)self.calendarLogic.selectedCalendarDay.month, (unsigned long)self.calendarLogic.selectedCalendarDay.day];
    
    NSLog(@"day = %@",self.calendarLogic.selectedCalendarDay);
    
    [self commonHiddenLeftArrowButton];
}

- (IBAction)myRightArrowNextButtonDidPress:(id)sender {
    
    [self.calendarLogic goToNextMonthInCalendarView:self.calendarView];
    self.myDateTitleLabel.text = [NSString stringWithFormat:@"%lu年%lu月%lu日", (unsigned long)self.calendarLogic.selectedCalendarDay.year, (unsigned long)self.calendarLogic.selectedCalendarDay.month, (unsigned long)self.calendarLogic.selectedCalendarDay.day];
    
    [self commonHiddenLeftArrowButton];
}

-(void)commonHiddenLeftArrowButton
{
    if ([self isMoreThanCurrentMonthWithSelectedCalendarDay:self.calendarLogic.selectedCalendarDay]) {
        
        self.myLeftArrowButton.userInteractionEnabled = YES;
    }
    else
    {
        self.myLeftArrowButton.userInteractionEnabled = NO;
    }
}

-(BOOL)isMoreThanCurrentMonthWithSelectedCalendarDay:(WQCalendarDay *) selectedCalendarDay
{
    NSInteger month = selectedCalendarDay.month;
    
    NSInteger year = selectedCalendarDay.year;
    
    if (month > _myCurrentMonth || year > _myCurrentYear) {
        
        return YES;
    }
    
    return NO;
}

#pragma mark WQCalendarLogicDelegate

-(void)WQCalendarLogic:(WQCalendarLogic *)WQCalendarLogic WQCalendarGridView:(WQCalendarGridView *)WQCalendarGridView autoResizeHeight:(CGFloat)height
{
    self.myPickerContentViewHeightConstraint.constant = height + 59 + 4 + 31;
}

@end

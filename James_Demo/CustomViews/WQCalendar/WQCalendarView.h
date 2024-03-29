//
//  WQCalendarView.h
//  WQCalendar
//
//  Created by Jason Lee on 14-3-12.
//  Copyright (c) 2014年 Jason Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQCalendarGridView.h"

//#define WQ_CALENDAR_ROW_HEIGHT      40.0f
#define WQ_CALENDAR_ROW_HEIGHT self.bounds.size.width/7

//typedef NS_ENUM(NSInteger, WQCalendarViewType)
//{
//    WQCalendarViewNormal,
//    WQCalendarViewStatistics
//};

@interface WQCalendarView : UIView

//@property (nonatomic, strong) UIImageView *weeklyHeader;
@property (nonatomic, strong) UIView *weeklyHeader;
@property (nonatomic, strong) WQCalendarGridView *gridView;
//@property (assign) WQCalendarViewType calendarViewType;

@end

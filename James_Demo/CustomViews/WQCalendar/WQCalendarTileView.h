//
//  WQCalendarTileView.h
//  WQCalendar
//
//  Created by Jason Lee on 14-3-4.
//  Copyright (c) 2014年 Jason Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQCalendarDay.h"

enum _WQCalendarTileStyle {
    kDefaultCalendarTileStyle = 0,
};
typedef enum _WQCalendarTileStyle WQCalendarTileStyle;

#pragma mark -

@interface WQCalendarTileView : UIView

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIImageView *myBackGroundImageView;

@property (nonatomic, strong) UIView *myTodayBackGroundView;

@property (nonatomic, assign) BOOL checked;

@property (nonatomic, assign) BOOL isCurrentDay;

//@property (nonatomic, assign) BOOL 

- (id)initWithStyle:(WQCalendarTileStyle)style;

@end

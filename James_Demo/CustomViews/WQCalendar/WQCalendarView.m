//
//  WQCalendarView.m
//  WQCalendar
//
//  Created by Jason Lee on 14-3-12.
//  Copyright (c) 2014年 Jason Lee. All rights reserved.
//

#import "WQCalendarView.h"

@interface WQCalendarView ()

@end

@implementation WQCalendarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        /*
        UIImage *weeklyHeaderImage = [UIImage imageNamed:@"weeklyTitle.png"];
        self.weeklyHeader = [[UIImageView alloc] initWithImage:weeklyHeaderImage];
        self.weeklyHeader.frame = (CGRect){0, 0, self.bounds.size.width, weeklyHeaderImage.size.height};
        [self addSubview:self.weeklyHeader];
        */
        
        self.weeklyHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 31)];
        _weeklyHeader.backgroundColor = [UIColor clearColor];
        
        NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil];
        
        CGFloat itemWidth = self.width/7;
        
        for (int i = 0; i<titleArray.count; i++) {
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, _weeklyHeader.height)];
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont systemFontOfSize:11];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithHexString:@"0x1d1d26"];
            label.alpha = 0.5;
            label.text = titleArray[i];
            
            [_weeklyHeader addSubview:label];
        }
        
        [self addSubview:_weeklyHeader];
        
        CGFloat headerHeight = self.weeklyHeader.frame.size.height;
        //CGFloat headerHeight = 0;
        CGRect gridRect = (CGRect){0, headerHeight, self.bounds.size.width, /*WQ_CALENDAR_ROW_HEIGHT * 6*/self.bounds.size.height-_weeklyHeader.height};
        self.gridView = [[WQCalendarGridView alloc] initWithFrame:gridRect];
        [self addSubview:self.gridView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

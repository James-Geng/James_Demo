//
//  WQCalendarTileView.m
//  WQCalendar
//
//  Created by Jason Lee on 14-3-4.
//  Copyright (c) 2014年 Jason Lee. All rights reserved.
//

#import "WQCalendarTileView.h"

@implementation WQCalendarTileView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(WQCalendarTileStyle)style
{
    self = [super init];
    if (self) {
        [self layoutWithStyle:style];
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

#pragma mark -

- (void)layoutWithStyle:(WQCalendarTileStyle)style
{
    switch (style) {
        case kDefaultCalendarTileStyle:
            [self layoutWithDefaultStyle];
            break;
            
        default:
            break;
    }
}

- (void)layoutWithDefaultStyle
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.myBackGroundImageView = [[UIImageView alloc] init];
    
    self.myBackGroundImageView.backgroundColor = [UIColor orangeColor];
    
//    self.myBackGroundImageView.image = [UIImage imageNamed:@"weeklyTitle"];
//    
//    self.myBackGroundImageView.layer.cornerRadius = self.bounds.size.width/2;
    
    self.myBackGroundImageView.hidden = YES;
    
    [self addSubview:self.myBackGroundImageView];
    
    self.myTodayBackGroundView = [[UIView alloc] init];
    _myTodayBackGroundView.backgroundColor = [UIColor colorWithHexString:@"0xEEEEEF"];
    //_myTodayBackGroundView.layer.cornerRadius = (self.bounds.size.width-10*2)/2;
    _myTodayBackGroundView.hidden = YES;
    [self addSubview:_myTodayBackGroundView];
    
    self.label = [[UILabel alloc] init];
    self.label.font = [UIFont systemFontOfSize:12];
    self.label.textColor = [UIColor colorWithHexString:@"0x1d1d26"];
    [self addSubview:self.label];
    
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor clearColor];
}

-(void)setNeedsLayout
{
    [super setNeedsLayout];
    
    NSLog(@"setNeedLayout");
}

#pragma mark -

- (void)setSelected:(BOOL)selected
{
    /*
    static UIColor *selectedColor = nil;
    if (selectedColor == nil) {
        selectedColor = [UIColor colorWithRed:70/255.0f green:171/255.0f blue:179/255.0f alpha:1];
    }*/
    
    if (selected) {
        //self.label.backgroundColor = selectedColor;
        
        self.label.textColor = [UIColor whiteColor];
        
        self.myBackGroundImageView.hidden = NO;
        /*
        if (self.isCurrentDay) {
            
            self.myTodayBackGroundView.hidden = NO;
        }
        else
        {
            self.myTodayBackGroundView.hidden = YES;
        }
        */
        
    } else {
        //self.label.backgroundColor = [UIColor whiteColor];
        
        self.myBackGroundImageView.hidden = YES;
        
        self.label.textColor = [UIColor blackColor];
/*
        if (self.isCurrentDay) {
            
            self.myTodayBackGroundView.hidden = NO;
        }
        else
        {
            self.myTodayBackGroundView.hidden = YES;
        }
 */
    }
    
    if (self.isCurrentDay) {
        
        self.myTodayBackGroundView.hidden = NO;
    }
    else
    {
        self.myTodayBackGroundView.hidden = YES;
    }
    
    _selected = selected;
}

-(void)setChecked:(BOOL)checked
{
    if (checked) {
        
        self.myBackGroundImageView.hidden = NO;
        
        self.myBackGroundImageView.backgroundColor = [UIColor colorWithRed:0/255.0f green:185/255.0f blue:255/255.0f alpha:0.2];
    }
    else
    {
    
         self.myBackGroundImageView.hidden = YES;
    }

    _checked = checked;
}

@end

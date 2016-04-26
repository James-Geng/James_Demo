//
//  ESSelectedDateAlertView.h
//  James_Demo
//
//  Created by sycf_ios on 16/4/26.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESSelectedDateAlertView : UIView

@property (weak, nonatomic) IBOutlet UIView *alphaView;
@property (weak, nonatomic) IBOutlet UIView *myPickerContentView;
@property (weak, nonatomic) IBOutlet UIButton *myCloseButton;
@property (weak, nonatomic) IBOutlet UIView *myDateLabelContentView;
@property (weak, nonatomic) IBOutlet UILabel *myDateTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *myLeftArrowButton;
@property (weak, nonatomic) IBOutlet UIButton *myRightArrowButton;

@end

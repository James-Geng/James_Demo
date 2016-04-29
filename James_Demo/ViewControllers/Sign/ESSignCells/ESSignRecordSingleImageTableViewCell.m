//
//  ESSignRecordSingleImageTableViewCell.m
//  James_Demo
//
//  Created by sycf_ios on 16/4/29.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ESSignRecordSingleImageTableViewCell.h"

@implementation ESSignRecordSingleImageTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.myTitleLabel.preferredMaxLayoutWidth = KScreenW - 7*2;
    
    self.myMainImageView.backgroundColor = [UIColor lightGrayColor];
}

-(void)setUpDataWithTitle:(NSString *)title dateString:(NSString *)dateString timeString:(NSString *)timeString signDayNumber:(NSString *)signDayNumber imageUrl:(NSString *)imageUrl
{
    self.myTitleLabel.text = title;
    
    self.myDetailDateTimeLabel.text = [NSString stringWithFormat:@"%@ %@",dateString,timeString];
    
    self.myDetailSignDayNumberLabel.text = [NSString stringWithFormat:@"#%@",signDayNumber];
    
    if (imageUrl && ![imageUrl isEqualToString:@""]) {
        
        //self.myMainImageView setImage:<#(UIImage * _Nullable)#>
        
        self.myMainImageViewHeightConstraint.constant = 160;
        
        self.myMainImageViewTopConstraint.constant = 14;
    }
    else
    {
    
        [self.myMainImageView setImage:nil];
        
        self.myMainImageViewHeightConstraint.constant = 0;
        
        self.myMainImageViewTopConstraint.constant = 7;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  ESSignRecordSingleImageTableViewCell.h
//  James_Demo
//
//  Created by sycf_ios on 16/4/29.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ESSignRecordSingleImageTableViewCellDelegate;

@interface ESSignRecordSingleImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *myContentView;
@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *myDetailDateTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *myDetailSignDayNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myMainImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myMainImageViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myMainImageViewTopConstraint;

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak) id delegate;

-(void)setUpDataWithTitle:(NSString *) title dateString:(NSString *) dateString timeString:(NSString *) timeString signDayNumber:(NSString *) signDayNumber imageUrl:(NSString *) imageUrl;

@end

@protocol ESSignRecordSingleImageTableViewCellDelegate

-(void)ESSignRecordSingleImageTableViewCell:(ESSignRecordSingleImageTableViewCell *) ESSignRecordSingleImageTableViewCell imageViewDidPress:(id) sender indexPath:(NSIndexPath *) indexPath;

@end

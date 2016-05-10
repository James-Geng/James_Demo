//
//  ESBaseModel.h
//  James_Demo
//
//  Created by sycf_ios on 16/5/9.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModelLib.h"

@interface ESBaseModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* ErrorMessage;

- (id) initWithDictionary: (NSDictionary*) dictionary;
- (NSMutableDictionary*) convertToDictionary;

@end

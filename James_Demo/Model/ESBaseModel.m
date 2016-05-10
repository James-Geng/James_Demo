//
//  ESBaseModel.m
//  James_Demo
//
//  Created by sycf_ios on 16/5/9.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ESBaseModel.h"

@implementation ESBaseModel

-(id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
    /*
     if (self=[self init]) {
     _ErrorMessage=dictionary[kFieldErrorMessage];
     }
     
     return self;
     */
    id obj=self;
    
    if (!(self=[self initWithDictionary:dictionary error:nil])) {
        // Legacy way
        if ((self=[obj init])) {
            _ErrorMessage=dictionary[@"message"];
        }
    }
    
    return self;
}

- (NSMutableDictionary *)convertToDictionary {
    return [NSMutableDictionary dictionaryWithDictionary:[self toDictionary]];
}

@end

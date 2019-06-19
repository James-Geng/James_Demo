//
//  CallObjCNative.m
//  libcocos2d iOS
//
//  Created by FG19 on 2019/5/3.
//

#import "CallObjCNative.h"

#import <UIKit/UIKit.h>
#import "CocosProjectManager.h"

void ExceptionCallback(const char *location, const char *message,const char *stack)
{
    [[CocosProjectManager sharedManager] exceptionCallbackLocation:[[NSString alloc] initWithUTF8String:location] message:[[NSString alloc] initWithUTF8String:message] stack:[[NSString alloc] initWithUTF8String:stack]];
}

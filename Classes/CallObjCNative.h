//
//  CallObjCNative.h
//  libcocos2d iOS
//
//  Created by FG19 on 2019/5/3.
//

#include "cocos2d.h"
using namespace cocos2d;

int GetNetTypeIOS();

void ExceptionCallback(const char *location, const char *message,const char *stack);

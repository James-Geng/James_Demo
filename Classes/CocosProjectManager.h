//
//  CocosProjectManager.h
//  libcocos2d Mac
//
//  Created by ios_001 on 2018/8/20.
//

#import <Foundation/Foundation.h>

@class RootViewController;

#define EXCEPTIONNOTIFICATION @"exceptionCallback_notification"

@interface CocosProjectManager : NSObject

+ (CocosProjectManager *)sharedManager;

@property (nonatomic, readonly) RootViewController* viewController;

-(void)startAPPLaunchConfigWithWindow:(UIWindow *) window; // didFinishLaunchingWithOptions 中调用

-(void)applicationDidBecomeActive; // applicationDidBecomeActive 中调用

-(void)applicationDidEnterBackground; // applicationDidEnterBackground 中调用

-(void)applicationWillEnterForeground; // applicationWillEnterForeground 中调用

-(void)applicationWillTerminate; // applicationWillTerminate 中调用

-(void)enterCocosRootViewController;

-(void)pushViewController:(UIViewController *) viewController;

#pragma mark Call JS

-(void)runJS:(NSString *) js;

#pragma mark C++ Call Native

-(void)exceptionCallbackLocation:(NSString *) location message:(NSString *) message stack:(NSString *) stack;

@end

//
//  CocosProjectManager.m
//  libcocos2d Mac
//
//  Created by blizzmi_ios_001 on 2018/8/20.
//

#import "CocosProjectManager.h"

#import "cocos2d.h"
#import "AppDelegate.h"
#import "RootViewController.h"
#import "platform/ios/CCEAGLView-ios.h"

#ifdef CC_FIX_ARTIFACTS_BY_STRECHING_TEXEL_TMX
#include "cocos/scripting/js-bindings/jswrapper/SeApi.h"
#else
#include "scripting/js-bindings/manual/ScriptingCore.h"
#endif
#ifndef HAVE_INSPECTOR
#include "ScriptingCore.h"
#endif

//#import "cocos-analytics/CAAgent.h"

@interface CocosProjectManager()

@property (strong, nonatomic) UIWindow *window;

@end

using namespace cocos2d;

Application* app = nullptr;

@implementation CocosProjectManager
// cocos2d application instance
//static AppDelegate* s_sharedApplication = nullptr;

+ (CocosProjectManager *)sharedManager {
    static CocosProjectManager *_sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

-(void)startAPPLaunchConfigWithWindow:(UIWindow *)window
{
    self.window = window;
    
    // Add the view controller's view to the window and display.
    float scale = [[UIScreen mainScreen] scale];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    //window = [[UIWindow alloc] initWithFrame: bounds];
    
    // cocos2d application instance
    app = new AppDelegate(bounds.size.width * scale, bounds.size.height * scale);
    app->setMultitouch(true);
    
    // Use RootViewController to manage CCEAGLView
    _viewController = [[RootViewController alloc]init];
#ifdef NSFoundationVersionNumber_iOS_7_0
    _viewController.automaticallyAdjustsScrollViewInsets = NO;
    _viewController.extendedLayoutIncludesOpaqueBars = NO;
    _viewController.edgesForExtendedLayout = UIRectEdgeAll;
#else
    _viewController.wantsFullScreenLayout = YES;
#endif
    
    UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:_viewController];
    
    ///*
     // Set RootViewController to window
     if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
     {
     // warning: addSubView doesn't work on iOS6
     [window addSubview: _viewController.view];
     }
     else
     {
     // use this method on ios6
     [window setRootViewController:rootNavigationController];
     }
    
     //*/
    [window makeKeyAndVisible];
    
    //run the cocos2d-x game scene
    app->start();
}

-(void)startAPPLaunchInfoConfigWithWindow:(UIWindow *)window
{
    self.window = window;
    
    // Add the view controller's view to the window and display.
    float scale = [[UIScreen mainScreen] scale];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    //window = [[UIWindow alloc] initWithFrame: bounds];
    
    // cocos2d application instance
    app = new AppDelegate(bounds.size.width * scale, bounds.size.height * scale);
    app->setMultitouch(true);
    
    // Use RootViewController to manage CCEAGLView
    _viewController = [[RootViewController alloc]init];
#ifdef NSFoundationVersionNumber_iOS_7_0
    _viewController.automaticallyAdjustsScrollViewInsets = NO;
    _viewController.extendedLayoutIncludesOpaqueBars = NO;
    _viewController.edgesForExtendedLayout = UIRectEdgeAll;
#else
    _viewController.wantsFullScreenLayout = YES;
#endif
    /*
    // Set RootViewController to window
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    {
        // warning: addSubView doesn't work on iOS6
        [window addSubview: _viewController.view];
    }
    else
    {
        // use this method on ios6
        [window setRootViewController:_viewController];
    }
    */
    
    //[window makeKeyAndVisible];
    
    //run the cocos2d-x game scene
    app->start();
}

-(void)enterCocosRootViewController
{
    UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:_viewController];
    
    // Set RootViewController to window
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    {
        // warning: addSubView doesn't work on iOS6
        [_window addSubview: _viewController.view];
    }
    else
    {
        // use this method on ios6
        //[window setRootViewController:_viewController];
        [_window setRootViewController:rootNavigationController];
    }
    
    [_window makeKeyAndVisible];
}

-(void)applicationWillResignActive
{
    NSLog(@"CocosProjectManager applicationWillResignActive");
}

-(void)applicationDidBecomeActive
{
    NSLog(@"CocosProjectManager applicationDidBecomeActive");
}

-(void)applicationDidEnterBackground
{
    app->applicationDidEnterBackground();
}

-(void)applicationWillEnterForeground
{
    
    app->applicationWillEnterForeground();
}

-(void)applicationWillTerminate
{
    
    delete app;
    app = nil;
}

-(void)pushViewController:(UIViewController *)viewController
{
    [_viewController.navigationController pushViewController:viewController animated:YES];
}

#pragma mark Call JS

-(void)runJS:(NSString *) js
{
    se::ScriptEngine::getInstance()->evalString([js UTF8String]);
}

#pragma mark C++ Call Native

-(void)exceptionCallbackLocation:(NSString *) location message:(NSString *) message stack:(NSString *) stack
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:3];
    [dic setObject:location?location:@"" forKey:@"location"];
    [dic setObject:message?message:@"" forKey:@"message"];
    [dic setObject:stack?stack:@"" forKey:@"stack"];
     
    [[NSNotificationCenter defaultCenter] postNotificationName:EXCEPTIONNOTIFICATION object:dic userInfo:nil];
}

@end

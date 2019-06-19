/****************************************************************************
 Copyright (c) 2010-2013 cocos2d-x.org
 Copyright (c) 2013-2016 Chukong Technologies Inc.
 Copyright (c) 2017-2018 Xiamen Yaji Software Co., Ltd.
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "AppController.h"
// 导入相关库头文件
#import "CocosProjectManager.h"

#import "RootViewController.h"
#import "SDKWrapper.h"

#import "DHJSBridge.h"

#import "OpenInstallSDK.h"
#import "OpenInstallManager.h"
#import "WXApi.h"
#import "APIConfig.h"
// 引入 JPush 功能所需头文件
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用 idfa 功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>
#import <UMCommon/UMCommon.h>
#import "LaunchViewManager.h"

@interface AppController()<DHJSBridgeDelegate>

@property (strong, nonatomic) UIViewController *launchViewController;

@property (assign, nonatomic) BOOL launchViewIsHide;

@end

@implementation AppController

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    window = [[UIWindow alloc] initWithFrame: bounds];
    
    [[SDKWrapper getInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    [[OpenInstallManager sharedManager] initOpenInstallSDk]; // openinstall 自定义初始化方法
    
    //[self initJPushSDKWithOptions:launchOptions];
    
    [self commonInitWeChatSDK];
    
    [self commonInitUMengSDK];
    
    //[[LaunchViewManager sharedManager] getLaunchInfoAPI];
    
    //[self enterOtherLaunchViewControllerWithWindow:window]; // 马甲包使用
    
    [[CocosProjectManager sharedManager] startAPPLaunchConfigWithWindow:window]; //  Cocos 引擎初始化方法 真金大厅使用
    
    [DHJSBridge sharedManager].delegate = self;
    
    [self enterLaunchViewController];
    
    //[self performSelector:@selector(hideLaunchView) withObject:nil afterDelay:3.033]; // test code
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    //保持屏幕常亮，
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    return YES;
}

+(AppController *)sharedAppController{
    
    return (AppController *)[[UIApplication sharedApplication] delegate];
}

// 用于启动马甲包
-(void)enterOtherLaunchViewControllerWithWindow:(UIWindow *) window
{
    // 马甲包根视图
    UIViewController *launchViewController = [[DHJSBridge sharedManager] getLaunchViewController];
    
    [window setRootViewController:launchViewController];
    
    [window makeKeyAndVisible];
    
    // 模拟马甲包开关接口（真实接口请自行编写）
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        //启动timer 模拟网络请求
        
        [NSThread sleepForTimeInterval:7];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // 进入真金大厅
            [[CocosProjectManager sharedManager] startAPPLaunchConfigWithWindow:window]; //  Cocos 引擎初始化方法
            
            [DHJSBridge sharedManager].delegate = self;
            
            [self enterLaunchViewController];
            
        });
        
    });
}

- (void)enterLaunchViewController
{
    
    _launchView = [[LaunchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [window.rootViewController.view addSubview:_launchView.view];
    
    [self performSelector:@selector(hideLaunchViewTimeOut) withObject:nil afterDelay:5];
    
}

-(void)hideLaunchView
{
    
    [_launchView hide];
    
    _launchViewIsHide = YES;
}

-(void)hideLaunchViewTimeOut
{
    if (!_launchViewIsHide) {
        
        NSLog(@"hideSplashView TimeOut");
        
        [self hideLaunchView];
    }
}

/*
 -(void)enterCocosRootViewController
 {
 
 // 在需要显示游戏界面的地方手动调用以下方法
 [[CocosProjectManager sharedManager] enterCocosRootViewController];
 
 [window makeKeyAndVisible];
 
 }
 */

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    [[SDKWrapper getInstance] applicationWillResignActive:application];
    
    self.lockScreen = YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    [[SDKWrapper getInstance] applicationDidBecomeActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    [[SDKWrapper getInstance] applicationDidEnterBackground:application];
    
    [[CocosProjectManager sharedManager] applicationDidEnterBackground];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
    [[SDKWrapper getInstance] applicationWillEnterForeground:application];
    
    [[CocosProjectManager sharedManager] applicationWillEnterForeground];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[SDKWrapper getInstance] applicationWillTerminate:application];
    
    [[CocosProjectManager sharedManager] applicationWillTerminate];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler
{
    //判断是否通过OpenInstall Universal Link 唤起App
    if ([OpenInstallSDK continueUserActivity:userActivity]){//如果使用了Universal link ，此方法必写
        return YES;
    }
    //其他第三方回调；
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:[DHJSBridge sharedManager]];
}


//适用目前所有iOS版本
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    //判断是否通过OpenInstall URL Scheme 唤起App
    if  ([OpenInstallSDK handLinkURL:url]){//必写
        return YES;
    }
    //其他第三方回调；
    return [WXApi handleOpenURL:url delegate:[DHJSBridge sharedManager]];
    
}

//iOS9以上，会优先走这个方法
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(nonnull NSDictionary *)options{
    //判断是否通过OpenInstall URL Scheme 唤起App
    if  ([OpenInstallSDK handLinkURL:url]){//必写
        return YES;
    }
    //其他第三方回调；
    return [WXApi handleOpenURL:url delegate:[DHJSBridge sharedManager]];
    
}

#pragma mark- JPUSHRegisterDelegate

// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
    }else{
        //从通知设置界面进入应用
    }
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)nowWindow {
    
    // 允许转屏
    if (self.isShouldAutorotate) {
        
        switch (self.orientation) {
            case 0:
                
                // 自由切换
                return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskPortrait;
                
                break;
            case 1:
                
                // 横屏
                return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskLandscapeLeft;
                
                break;
            case 2:
                
                // 竖屏
                return UIInterfaceOrientationMaskPortrait;
                
                break;
                
            default:
                break;
        }
        
        //return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskPortrait;
    }
    
    return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskLandscapeLeft;
}

-(void)initJPushSDKWithOptions:(NSDictionary *)launchOptions
{
    //Required
    //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义 categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    // Optional
    // 获取 IDFA
    // 如需使用 IDFA 功能请添加此代码并在初始化方法的 advertisingIdentifier 参数中填写对应值
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    // Required
    // init Push
    // notice: 2.1.5 版本的 SDK 新增的注册方法，改成可上报 IDFA，如果没有使用 IDFA 直接传 nil
    // 如需继续使用 pushConfig.plist 文件声明 appKey 等配置内容，请依旧使用 [JPUSHService setupWithOption:launchOptions] 方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:JPushAPPKey
                          channel:@"App Store"
                 apsForProduction:YES
            advertisingIdentifier:advertisingId];
}

-(void)commonInitWeChatSDK
{
    [WXApi registerApp:WeChatSDKKey];
}

-(void)commonInitUMengSDK
{
    [UMConfigure setLogEnabled:YES];//设置打开日志
    
    [UMConfigure initWithAppkey:UMengAPPKey channel:CHANEL_ID];
    
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

#pragma mark DHJSBridgeDelegate

-(void)DHJSBridge:(DHJSBridge *)DHJSBridge pushViewController:(UIViewController *)viewController
{
    //[(UINavigationController *)window.rootViewController pushViewController:viewController animated:YES];
    
    [[CocosProjectManager sharedManager] pushViewController:viewController];
}

@end

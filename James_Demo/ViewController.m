//
//  ViewController.m
//  James_Demo
//
//  Created by sycf_ios on 16/4/22.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ViewController.h"
#import "WQCalendarLogic.h"
#import "WQDraggableCalendarView.h"
#import "ESSelectedDateAlertView.h"
#import "ESSignCalendarStatisticsViewController.h"
#import "ESSignViewController.h"
#import "AFNetworking.h"
#import <objc/runtime.h>
#import <YWFeedbackFMWK/YWFeedbackKit.h>
//#import <AlipaySDK/AlipaySDK.h>
#import <QiniuSDK.h>

@interface ViewController ()<ESSelectedDateAlertViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) WQDraggableCalendarView *calendarView;
@property (nonatomic, strong) WQCalendarLogic *calendarLogic;

@property (weak, nonatomic) IBOutlet UILabel *myDateLabel;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) NSMutableArray *myTableViewDataArray;

@property (nonatomic, strong) YWFeedbackKit *feedbackKit;
@property (nonatomic, assign) YWEnvironment environment;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setTranslucent:NO];
    
    //self.calendarLogic = [[WQCalendarLogic alloc] init];
    
    //[self showCalendar]; //
    
    self.myTableViewDataArray = [NSMutableArray arrayWithObjects:@"SignCellViewController", nil];
    
    self.myTableView.tableFooterView = [[UIView alloc] init];
    
    // hello, this is james captain speaking.
    // ladies and getman, welecom to china.
    
    // hahahaha this is james captain change commit test at branch 'james'
    
    // this is branch snake.........
    
    /*
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:@"1.0" forKey:@"version"];
    
    [dic setObject:@"ios" forKey:@"os"];
    
    [dic setObject:@"12312312" forKey:@"uid"];
    
    [dic setObject:@"212312313312" forKey:@"token"];
    
    //[dic setObject:@"13510802902" forKey:@"phone"];
    
    //[dic setObject:@"Keai1234" forKey:@"password"];
    
    [dic setObject:@"common/uploadtoken" forKey:@"action"];
    
//    [dic setObject:@"test/test" forKey:@"action"];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    //session.securityPolicy.allowInvalidCertificates = YES; // not recommended for production
    //session.responseSerializer = [AFJSONResponseSerializer serializer];
    //session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //允许非权威机构颁发的证书
    session.securityPolicy.allowInvalidCertificates = YES;
    //也不验证域名一致性
    session.securityPolicy.validatesDomainName = NO;
    //关闭缓存避免干扰测试
    session.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    */
    /*
    [session POST:@"https://139.196.180.54/" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"sucess = %@",responseObject);
        
        if (responseObject) {
            
            NSDictionary *data = [responseObject objectForKey:@"data"];
            
            //NSString *token = [data objectForKey:@"uploadtoken"];
            
            NSString *token = @"1";
            
            if (token && ![token isEqualToString:@""]) {
                
                //NSString *token = @"从服务端SDK获取";
                
                QNUploadOption *opt = [[QNUploadOption alloc] initWithMime:@"text/plain" progressHandler:nil params:@{ @"x:foo":@"fooval" } checkCrc:YES cancellationSignal:nil];
                
                QNUploadManager *upManager = [[QNUploadManager alloc] init];
                
                UIImage *image = [UIImage imageNamed:@"weeklyTitle"];
                
                NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
                
                //NSData *data = [@"Hello, World!" dataUsingEncoding : NSUTF8StringEncoding];
                
                [upManager putData:imageData key:@"i_1324122313321212" token:token
                          complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                              
                              NSLog(@"info = %@", info);
                              
                              NSLog(@"resp = %@", resp);
                              
                          } option:opt];
                
                
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error = %@",error);
        
    }];
     
    */
    
    
    
    /*
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //允许非权威机构颁发的证书
    manager.securityPolicy.allowInvalidCertificates = YES;
    //也不验证域名一致性
    manager.securityPolicy.validatesDomainName = NO;
    //关闭缓存避免干扰测试
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [manager GET:@"https://tv.diveinedu.com/channel/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    */
    /*
    //NSString *url = @"https://maps.googleapis.com/maps/api/place/details/json?placeid=23232323&key=23232323";
    
    NSString *url = @"http://data.mobile.idol001.com/api_moblie_idol.php?action=get_care_star_xingcheng_next";
    
    [session GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"sucess = %@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error = %@",error);
        
    }];
    */
    
    [self runTimeTest];
    
}

-(void)aliBaiChuanTest
{
    self.feedbackKit = [[YWFeedbackKit alloc] initWithAppKey:@"23371534"];
    
    _feedbackKit.environment = YWEnvironmentRelease;
    
    _feedbackKit.extInfo = @{@"loginTime":[[NSDate date] description],
                             @"visitPath":@"登陆->关于->反馈",
                             @"应用自定义扩展信息":@"开发者可以根据需要设置不同的自定义信息，方便在反馈系统中查看"};
    
    _feedbackKit.customUIPlist = @{@"bgColor":@"#00bfff"};
    
    [self _openFeedbackViewController];
}

- (void)_openFeedbackViewController
{
    __weak typeof(self) weakSelf = self;
    
    [_feedbackKit makeFeedbackViewControllerWithCompletionBlock:^(YWFeedbackViewController *viewController, NSError *error) {
        if ( viewController != nil ) {
#warning 这里可以设置你需要显示的标题
            viewController.title = @"反馈界面";
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
            [weakSelf presentViewController:nav animated:YES completion:nil];
            
            viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:weakSelf action:@selector(actionQuitFeedback)];
            
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清除缓存" style:UIBarButtonItemStylePlain
                                                                                              target:weakSelf action:@selector(actionCleanMemory:)];
            
            __weak typeof(nav) weakNav = nav;
            
            [viewController setOpenURLBlock:^(NSString *aURLString, UIViewController *aParentController) {
                UIViewController *webVC = [[UIViewController alloc] initWithNibName:nil bundle:nil];
                UIWebView *webView = [[UIWebView alloc] initWithFrame:webVC.view.bounds];
                webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
                
                [webVC.view addSubview:webView];
                [weakNav pushViewController:webVC animated:YES];
                [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:aURLString]]];
            }];
        } else {
            NSString *title = [error.userInfo objectForKey:@"msg"]?:@"接口调用失败，请保持网络通畅！";
            NSLog(@"alert = %@",title);
        }
    }];
}

- (void)actionQuitFeedback
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)actionCleanMemory:(id)sender
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

-(void)runTimeTest
{
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
    
    //首先定义一个全局变量，用它的地址作为关联对象的key
    static char associatedObjectKey;
    //设置关联对象
    objc_setAssociatedObject(self, &associatedObjectKey, @"添加的字符串属性", OBJC_ASSOCIATION_RETAIN_NONATOMIC); //获取关联对象
    NSString *string = objc_getAssociatedObject(self, &associatedObjectKey);
    NSLog(@"AssociatedObject = %@", string);
}

- (IBAction)buttonDidPress:(id)sender {
    
    [self aliBaiChuanTest];
    return;
    ESSelectedDateAlertView *selectedDateAlertView = [[ESSelectedDateAlertView alloc] init];
    selectedDateAlertView.delegate = self;
    
    [selectedDateAlertView showInView:[UIApplication sharedApplication].keyWindow withFrame:[UIScreen mainScreen].bounds];
}

- (IBAction)calendarStatisticsPushDidPress:(id)sender {
    
    ESSignCalendarStatisticsViewController *signCSViewController = [[ESSignCalendarStatisticsViewController alloc] initWithNibName:@"ESSignCalendarStatisticsViewController" bundle:nil];
    
    [self.navigationController pushViewController:signCSViewController animated:YES];
}

- (void)showCalendar
{
    CGRect calendarRect = self.view.bounds;
    calendarRect.origin.y += 152, calendarRect.size.height -= 52;
    self.calendarView = [[WQDraggableCalendarView alloc] initWithFrame:calendarRect];
    //self.calendarView.draggble = NO;
    
    [self.view addSubview:self.calendarView];
    
    self.calendarView.backgroundColor = [UIColor clearColor];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYYMMdd";
    
    NSDate *myDate = [formatter dateFromString:@"20160422"];
    
    [self.calendarLogic reloadCalendarView:self.calendarView withDate:myDate];
    
    //self.calendarLogic.selectedDate = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*3];
    /*
    CGRect scrollRect = self.view.bounds;
    scrollRect.origin.y = 400;
    scrollRect.size.height = 40;
    self.scrollCalendarView = [[WQScrollCalendarWrapperView alloc] initWithFrame:scrollRect];
    self.scrollCalendarView.backgroundColor = [UIColor greenColor];
    self.scrollCalendarView.delegate = self;
    [self.view addSubview:self.scrollCalendarView];
    [self.scrollCalendarView reloadData];
    */
}

#pragma mark ESSelectedDateAlertViewDelegate

-(void)ESSelectedDateAlertView:(ESSelectedDateAlertView *)ESSelectedDateAlertView closeViewWithSelectedDate:(NSDate *)selectedDate
{
    NSLog(@"selected date = %@",selectedDate);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY年MM月dd日";
    
    self.myDateLabel.text = [formatter stringFromDate:selectedDate];
}

#pragma mark UITableViewDelegate/Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_myTableViewDataArray.count>0) {
        
        return _myTableViewDataArray.count;
    }
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    
    
    if (_myTableViewDataArray.count > indexPath.row) {
        
        NSString *title = _myTableViewDataArray[indexPath.row];
        
        cell.textLabel.text = title;
    }
    else
    {
        cell.textLabel.text = @"EXO";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            
        {
            ESSignViewController *signViewController = [[ESSignViewController alloc] initWithNibName:@"ESSignViewController" bundle:nil];
            
            [self.navigationController pushViewController:signViewController animated:YES];
        }
            
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

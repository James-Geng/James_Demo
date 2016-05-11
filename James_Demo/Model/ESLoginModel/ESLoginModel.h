//
//  ESLoginModel.h
//  James_Demo
//
//  Created by sycf_ios on 16/5/11.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESBaseModel.h"

@interface ESLoginModel : JSONModel

@end

@interface ESPhoneLoginDataModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* avatar;
@property (strong, nonatomic) NSString<Optional>* expire_at;
@property (strong, nonatomic) NSString<Optional>* intro;
@property (strong, nonatomic) NSString<Optional>* is_completed;
@property (strong, nonatomic) NSString<Optional>* nickname;
@property (strong, nonatomic) NSString<Optional>* phone_state;
@property (strong, nonatomic) NSString<Optional>* token;
@property (strong, nonatomic) NSString<Optional>* uid;

@end

@interface ESPhoneLoginOutputModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* code;
@property (strong, nonatomic) ESPhoneLoginDataModel<Optional> *data;
@property (strong, nonatomic) NSString<Optional>* msg;

@end

// 刷新token

@interface ESRefreshTokenDataModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* expire_at;

@end

@interface ESRefreshTokenOutputModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* code;
@property (strong, nonatomic) ESRefreshTokenDataModel<Optional> *data;
@property (strong, nonatomic) NSString<Optional>* msg;

@end

// 第三方账号登录

@interface ESThirdLoginIntputModel : ESBaseModel

@property (strong, nonatomic) NSString* th_uid; // 第三方帐号唯一标识
@property (strong, nonatomic) NSString* login_type; // QQ = 2 微博 = 3
@property (strong, nonatomic) NSString<Optional>* nickname; // 从第三方获得的昵称，选填
@property (strong, nonatomic) NSString<Optional>* avatar; // 从第三方获得的头像url，选填

@end

@interface ESThirdLoginOutputModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* code;
@property (strong, nonatomic) ESPhoneLoginDataModel<Optional> *data;
@property (strong, nonatomic) NSString<Optional>* msg;

@end

// 发送验证码

@interface ESSendPhoneCodeInputModel : ESBaseModel

@property (strong, nonatomic) NSString* phone;
@property (strong, nonatomic) NSString* type; // 注册传1 修改密码传2

@end

@interface ESSendPhoneCodeOutputModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* code;

@property (strong, nonatomic) NSString<Optional>* msg;

@end

// 获取自己的资料

@interface ESGetMyselfUserInfoDataModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* nickname;
@property (strong, nonatomic) NSString<Optional>* avatar;
@property (strong, nonatomic) NSString<Optional>* intro;
@property (strong, nonatomic) NSString<Optional>* is_completed;
@property (strong, nonatomic) NSString<Optional>* phone_state; //手机验证状态      0未验证 1已验证

@end

@interface ESGetMyselfUserInfoOutputModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* code;
@property (strong, nonatomic) ESGetMyselfUserInfoDataModel<Optional> *data;
@property (strong, nonatomic) NSString<Optional>* msg;

@end

// 获取别人的资料

@interface ESGetOtherUserInfoInputModel : ESBaseModel

@property (strong, nonatomic) NSString *orther_uid;

@end

@interface ESGetOtherUserInfoOutputModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* code;
@property (strong, nonatomic) ESGetMyselfUserInfoDataModel<Optional> *data;
@property (strong, nonatomic) NSString<Optional>* msg;

@end

// 手机号注册

@interface ESPhoneRegisterInputModel : ESBaseModel

@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *code; // 验证码，测试阶段 1234
@property (strong, nonatomic) NSString *password;

@end

@interface ESPhoneRegisterOutputModel : JSONModel

@property (strong, nonatomic) NSString<Optional>* code;

@property (strong, nonatomic) NSString<Optional>* msg;

@end

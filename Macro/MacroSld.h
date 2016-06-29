//
//  MacroSld.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/3.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#ifndef ____MacroSld_h
#define ____MacroSld_h


////开放


#pragma mark url params

//#define BASEURL @"http://appapitest.milangang.com/api"//演示
//#define BASEURL  @"http://appapix.milangang.com/api"//永强个人机
//#define BASEURL @"http://mlgappapi.milangang.com/api"//乐天
//#define BASEURL @"http://appapidemo.milangang.com/api"//测试242
//#define BASEURL @"http://myappapi.milangang.com/api"//江涛
//#define BASEURL @"http://myappapidemo.milangang.com/api"//郭涛个人
#define BASEURL @"http://appapi.milangang.com/api"//正式


//#define BASEURL_SHOP @"http://mobileapi.milangang.com"//测试 商家 主页
//#define BASEURL_SHOP @"http://mtest.milangang.com"//演示 商家 主页
#define BASEURL_SHOP @"http://m.milangang.com"//正式 商家 主页

//#define BASEURL_ORDER @"http://appapidemo.milangang.com/ordercontractsell.html" //合同 测试
#define BASEURL_ORDER @"http://appapi.milangang.com/ordercontractsell.html" //合同 正式

//微信appid 
#define LOCAL_WEI_APPID @"wxd6db347301706142"

//单例
#define DECLARE_SINGLETON(CLASS_NAME) \
+ (CLASS_NAME *)sharedInstance;


#define SYNTHESIZE_SINGLETONE_FOR_CLASS(CLASS_NAME) \
+ (CLASS_NAME *)sharedInstance\
{\
static CLASS_NAME *__##CLASS_NAME##_instance = nil;\
\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
__##CLASS_NAME##_instance = [[CLASS_NAME alloc] init];\
});\
return __##CLASS_NAME##_instance;\
}



//屏幕宽高

#define ScreenScale()     [[UIScreen mainScreen] scale]
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height//屏幕高度
#define ScreenHeightMax 548

//判断是否是ipad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否是ios7
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
//宏定义
#define IsIphone5  [UIScreen mainScreen].bounds.size.height>500?YES:NO
//ios7的宏定义
#define  IOS7_AUTO_SC self.automaticallyAdjustsScrollViewInsets = NO //scrollde contentinset


#define STATUSBAR_SHOW 


//本地数据
#define LOCAL_PWD @"LOCAL_PWD"//记住密码
#define LOCAL_USER_NAME @"LOCAL_USERNAME"//自动登陆
#define LOCAL_RECEIVE_TUISONG @"tuisong"//是否打开推送
#define LOCAL_TOKEN @"sld_token"//本地token
#define LOCAL_TIME_VERSION @"LOCAL_TIME_VERSION"//版本更新
#define LOCAL_TIME_RELOGIN @"LOCAL_TIME_RELOGIN"//长期不操作 重新登陆
#define LOCAL_PUSH_JSON @"LOCAL_PUSH_JSON"//推送的json

//本地通知
#define NOTICE_UNREAD_MESSAGE @"NOTICE_UNREAD_MESSAGE"//未读消息请求成功
#define NOTICE_TABBAR_CHANGE @"NOTICE_TABBAR_CHANGE"//分页导航栏切换
#define NOTICE_PUBLISH_SUCCESS @"NOTICE_PUBLISH_SUCCESS"//发布商品成功

//请求时间
#define TIME_REQUEST_OUT 10

//颜色

#define COLOR_LINE_IMAGE [UIColor colorWithRed:244/255.0 green:245/255.0 blue:245/255.0 alpha:1]//图片边界

#define COLOR_ORANGE_ML [GlobalMethod exchangeColorWith16:@"f15723"]//橘色
#define COLOR_RED_ML     [UIColor colorWithRed:216.0f/255.0 green:114.0f/255.0 blue:101.0f/255.0 alpha:1.0f]//红色

#define COLOR_GRAY_LINE   [GlobalMethod exchangeColorWith16:@"e6ebec"]//灰线 灰背景

#define COLOR_GRAY_LINE_WHITE [GlobalMethod exchangeColorWith16:@"f3f3f3"]//灰线 白背景


#define COLOR_CONTROLLER_BG  [UIColor colorWithRed:242.0f/255.0 green:242.0f/255.0 blue:242.0f/255.0 alpha:1]

#define COLOR_RANDOM                                     \
[UIColor colorWithRed:arc4random_uniform(255) / 255.0 \
green:arc4random_uniform(255) / 255.0 \
blue:arc4random_uniform(255) / 255.0 \
alpha:255 / 255.0]

//默认图片
#define IMAGE_NAME_DEFAULT  @"默认图.jpg"//默认图片名称


//按钮的颜色
typedef NS_ENUM(NSInteger, ENUM_SLD_BTN_COLOR) {
    ENUM_SLD_ORANGE = 0,
    ENUM_SLD_YELLOW,
    ENUM_SLD_GRAY
};

//二维码显示标题
typedef NS_ENUM(NSInteger, ENUM_SLD_SHARE_TITLE) {
    ENUM_SLD_PRODUCT,
    ENUM_SLD_SHOP,
};

//颜色 by sqc
#pragma mark 颜色值 bysqc
#define COLOR_NORMALORANGE [GlobalMethod exchangeColorWith16:@"f15723"]
#define COLOR_NORMALORANGE_CLICK [GlobalMethod exchangeColorWith16:@"e7450e"]
#define COLOR_NORMALYELLOW [GlobalMethod exchangeColorWith16:@"ff9900"]
#define COLOR_NORMALYELLOW_CLICK [GlobalMethod exchangeColorWith16:@"f49200"]
#define COLOR_NORMALGRAY [GlobalMethod exchangeColorWith16:@"e0e1e3"]
#define COLOR_NORMALGRAY_CLICK [GlobalMethod exchangeColorWith16:@"d5dcdd"]

#define COLOR_NORMALTITLE [GlobalMethod exchangeColorWith16:@"000000"]
#define COLOR_NORMALCONTENT [GlobalMethod exchangeColorWith16:@"999999"]
#define COLOR_CLEAR [UIColor clearColor]


#define COLOR_CATE2BG [GlobalMethod exchangeColorWith16:@"f4f5f5"]
#define COLOR_MAINPAGE_BG [GlobalMethod exchangeColorWith16:@"f4f5f5"]
#define COLOR_MARKETCHOOSE [GlobalMethod exchangeColorWith16:@"f4f5f5"]

#define COLOR_MENU_HENGTIAO [GlobalMethod exchangeColorWith16:@"fafafa"]
//大小 by sqc
#define DIMEN_NOR_TITLE 14
#define DIMEN_SECOND_CONTENT 12

#pragma mark 大小 列表页
#define DIMEN_PDLISTITEM_PRICE 18

#define DIMEN_NOR_PADDING 12

#define NUM_BTN_ROUND 2

#pragma mark alert

#define COMMENT_NO_TIP @"该商品暂无评价"




#define  METHODKEY @"method"

//login
#define LOGIN_URL @"/account.ashx"
#define LOGIN_METHOD @"login"
#define LOGIN_PRAM_USERNAME @"username"
#define LOGIN_PRAM_PASSWORD @"password"

//checkVersion
#define CHECKVERSION_URL @"/download.ashx"
#define CHEcKVERSION_METHOD @"checkversion"


//HomeData
#define  HOMEDATA_URL  @"/home.ashx"
#define  HOMEDATA_METHOD @"homedata"

//search
#define  SEARCHPRODUCT_URL  @"/list.ashx"
#define SEARCHPRODUCT_METHOD  @"search" 
#define   SEARCHPRODUCT_PRAM_KEY  @"k"  
#define SEARCHPRODUCT_PRAM_marketType  @"marketType"  
#define  SEARCHPRODUCT_PRAM_categoryId  @"categoryId"  
#define  SEARCHPRODUCT_PRAM_sortId  @"sort"  
#define  SEARCHPRODUCT_PRAM_pageIndex  @"pageIndex"  
#define SEARCHPRODUCT_PRAM_pageSize  @"pageSize"  

//Supplier
 #define SEARCHDianpu_URL  @"/supplier.ashx"  
 #define SEARCHDianpu_METHOD  @"search"  
 #define SEARCHDianpu_PRAM_sortId  @"sort"  
 #define SEARCHDianpu_PRAM_pageIndex  @"pageIndex"  
 #define SEARCHDianpu_PRAM_pageSize  @"pageSize"  
 #define SEARCHDianpu_PRAM_KEY  @"k"  

//Manage Order
#define ManageOrder_URL @"/sellorder.ashx"
#define ManageOrder_METHOD @"sellorderlist"

//Cate
 #define GETCATE_URL  @"/category.ashx"  
 #define GETCATE_METHOD  @"firstleve"

//
 #define GETMSG_MESSAGE   @"/Message.ashx"  
 #define GETMSG_URL  @"/Order.ashx"  
 #define GETMSG_METHOD_COUNT  @"GetUnreadMessageCount"  

 #define GETMSG_METHOD_GETMESSAGE  @"GetMessage"  
 #define GETMSG_KEY_FIRSTID  @"firstId"  
 #define GETMSG_KEY_LASTID  @"lastId"  
 #define GETMSG_KEY_SIZE  @"size"  
 #define GETMSG_KEY_MESSAGTETYPE  @"messageType"  

 #define GETMSG_METHOD_NOTIREAD  @"NotifyReadMessage"  
 #define GETMSG_KEY_MSGID  @"messageId"  

 #define GETMSG_METHOD_GetNoPushMessageCount  @"GetNoPushMessageCount"  


 #define YITUSOUTU  @"/looklike.ashx?method searchimg"  
 #define YITUSOUTU_FILE  @"File1"  

 #define ZHAOXIANGSI  @"/looklike.ashx"  
 #define ZHAOXIANGSI_METHOD  @"searchlike"  

 #define LOCATION_URL   @"/Address.ashx"  
 #define LOCATION_METHOD_PROV   @"GetProvince"  
 #define LOCATION_METHOD_CITY   @"GetCity"  
 #define LOCATION_METHOD_AREA   @"GetArea" 



//html 方法名
#define LOCAL_HTML_METHOD_SHAREAPP @"toShareWithApp"//分享
#define LOCAL_HTML_METHOD_PRODUCTDETAIL @"gotoProductDetail"//物品详情
#define LOCAL_HTML_METHOD_GROUPSELF @"gotoGroupProductAct"//自定义分组
#define LOCAL_HTML_METHOD_CALLQQ @"callQQ"//qq
#define LOCAL_HTML_MEHTOD_LOGIN @"gotologin"//login
#define LOACL_HTML_METHOD_MAIN_LIST @"gotoProductList"//main list
#define LOCAL_HTML_METHOD_MAIN_URL @"gotoAdv"//main url
#define LOCAL_HTML_METHOD_SHOP_DETAIL  @"gotoStore"//店铺详情
#define LOCAL_HTML_METHOD_COPY @"cliptext"//复制
#define LOCAL_HTML_METHOD_GOBACK @"goback"//返回一层
#define LOCAL_HTML_METHDO_GOHOME @"gohome"//返回到首页

//评价列表
#define GETITEM_COMMENT_URL @"/item.ashx"
  #define GETITEM_COMMENT_METHOD_ITEMBASE @"itemComments"
  #define GETITEM_COMMENT_KEY_ID @"Id"
  #define GETITEM_COMMENT_KEY_PAGEINDEX @"pageIndex"
  #define GETITEM_COMMENT_KEY_PAGESIZE @"pageSize"




//商品详情 获取购物车数量
#define PRODUCTDETAIL_CARSUM_METHOD @"getcartsum"

#endif

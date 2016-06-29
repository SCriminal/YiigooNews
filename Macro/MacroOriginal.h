//
//  MacroOriginal.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/3.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#ifndef ____MacroOriginal_h
#define ____MacroOriginal_h



#define MLRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:arc4random_uniform(255)/255.0]

#define iOS7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)

#define FOR4INCH ([UIScreen mainScreen].bounds.size.height == 568.0)

#define HOMEMSG_REGET_TIME 2 * 60


// custom color
#define customOrange  [UIColor colorWithRed:238.0f/255.0 green:115.0f/255.0 blue:5.0f/255.0   alpha:1]
#define requiredGray  [UIColor colorWithRed:242.0f/255.0 green:242.0f/255.0 blue:242.0f/255.0 alpha:1]
#define customNewGray [UIColor colorWithRed:154.0f/255.0 green:154.0f/255.0 blue:154.0f/255.0 alpha:1.0f]
#define customGray    [UIColor colorWithRed:213.0f/255.0 green:220.0f/255.0 blue:221.0f/255.0 alpha:1.0f]
#define customRed     [UIColor colorWithRed:216.0f/255.0 green:114.0f/255.0 blue:101.0f/255.0 alpha:1.0f]
#define customBlack   [UIColor colorWithRed:69.0f/255.0  green:69.0f/255.0  blue:69.0f/255.0  alpha:1.0f]
//随机色颜色
#define ColorRandom                                     \
[UIColor colorWithRed:arc4random_uniform(255) / 255.0 \
green:arc4random_uniform(255) / 255.0 \
blue:arc4random_uniform(255) / 255.0 \
alpha:255 / 255.0]


// screenBounds
#define screenWidth   [UIScreen mainScreen].bounds.size.width
#define screenHeight  [UIScreen mainScreen].bounds.size.height

// cellFont
#define WMPRICEFONT   [UIFont systemFontOfSize:18.0f]
#define WMNAMEFONT    [UIFont systemFontOfSize:17.0f]
#define WMBEGINFONT   [UIFont systemFontOfSize:16.0f]
#define WMMEDDILEFONT [UIFont systemFontOfSize:13.0f]
#define WMSYMBOLFONT  [UIFont systemFontOfSize:12.0f]
#define WMSMALLFONT   [UIFont systemFontOfSize:9.0f]
#define FONT12 [UIFont systemFontOfSize:12.0f]
#define FONT13 [UIFont systemFontOfSize:13.0f]
#define FONT14 [UIFont systemFontOfSize:14.0f]
#define FONT15 [UIFont systemFontOfSize:15.0f]
#define FONT16 [UIFont systemFontOfSize:16.0f]
#define FONT17 [UIFont systemFontOfSize:17.0f]

// RGB
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif

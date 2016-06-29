//
//  MacroManageOrder.h
//  米兰港
//
//  Created by 隋林栋 on 15/7/23.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#ifndef ____MacroManageOrder_h
#define ____MacroManageOrder_h


//退款单状态
typedef NS_ENUM(NSInteger, ENUM_SLD_RefundStatus) {
    ENUM_RefundStatus_Apply =1,//申请中
    ENUM_RefundStatus_Agree =2,//卖家同意退款
    ENUM_RefundStatus_Refuse = 3,//卖家拒绝退款
    ENUM_RefundStatus_Cancel = 4,//卖家取消退款
    ENUM_RefundStatus_Success = 5,//退款成功
    ENUM_RefundStatus_Close = 6//退款关闭
};

//订单状态
typedef NS_ENUM(NSInteger, ENUM_SLD_OrderStatus) {
    ENUM_OrderStatus_Close = -1,//交易关闭
    ENUM_OrderStatus_ToBeConfirmBySupplier = 0,//// 待卖家确认
    ENUM_OrderStatus_WaitingForPayAll =1,/// 待付款
    ENUM_OrderStatus_WaitingForPayInAdvance =2,//// 待付预付款
    ENUM_OrderStatus_WaitingForDeliver =3,/// 待发货
    ENUM_OrderStatus_WaitingForConfirmReceive=4,/// 待确认收货
    ENUM_OrderStatus_WaitingForPayBalance =5,/// 待付中期款
    ENUM_OrderStatus_WaitingForPayTail=6,/// 待付尾款
    ENUM_OrderStatus_Complete =7,/// 交易成功
    ENUM_OrderStatus_WaitingForPrepare=8,/// 备货中
    ENUM_OrderStatus_WaitingForAuditing = 9,/// 待审核
    ENUM_OrderStatus_WaitingForReview = 10, /// 待复核
    ENUM_OrderStatus_ToBeConfirmByBuyer =11,/// 待买家确认
    ENUM_OrderStatus_WaitingForConfirmPay = 12 /// 待确认支付
};

//订单类型
typedef NS_ENUM(NSInteger, ENUM_SLD_OrderType) {
    ENUM_OrderType_General = 1,//普通
    ENUM_OrderType_Sample =2,//样品
    ENUM_OrderType_Step =4,//分期
    ENUM_OrderType_Finance =5//不等贷
};

//支付方式
typedef NS_ENUM(NSInteger, ENUM_SLD_PayType) {
    ENUM_PayType_UnSelect = 0,
    ENUM_PayType_OnLine,
    ENUM_PayType_OnLineInstallment,
    ENUM_PayType_Fund
};


#endif

//
//  MGToastDefines.h
//  TestDemo
//
//  Created by Che Yongzi on 2017/9/28.
//  Copyright © 2017年 Che Yongzi. All rights reserved.
//

#ifndef MGToastDefines_h
#define MGToastDefines_h

#import "MGToastView.h"

@class MGToast;

/**
 设置MGToast样式
 
 @param style MGToastStyle
 @return MGToast
 */
typedef MGToast*(^ToastStyle)(MGToastStyle style);

/**
 设置MGToast展示方向
 
 @param orientation MGToastOrientation
 @return MGToast
 */
typedef MGToast*(^ToastOrientation)(MGToastOrientation orientation);

/**
 主要用于设置Msg与image
 
 @param data msg与image name
 @return MGToast
 */
typedef MGToast*(^ToastData)(NSString* data);

/**
 主要用于设置Delay和duration
 
 @param time CGFloat
 @return MGToast
 */
typedef MGToast*(^ToastValue)(CGFloat time);

/**
 开始初始化
 @return MGToast
 */
typedef MGToast*(^ToastInit)(void);

/**
 开始展示Toast
 */
typedef void(^ToastEnd)(void);

#endif /* MGToastDefines_h */

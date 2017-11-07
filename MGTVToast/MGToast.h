//
//  MGToast.h
//  TestDemo
//
//  Created by Che Yongzi on 2017/9/26.
//  Copyright © 2017年 Che Yongzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGToastDefines.h"

/**
 MGToast 主要用于提示信息
 展示方向：HNTVToastFromDown 默认为从下方展示
 展示样式：HNTVToastStyle    默认为纯文本
 文本属性:{}
 */
@interface MGToast : NSObject
//开始生成Toast
@property (class, nonatomic, copy) ToastInit                    start;
//展示样式, 默认为MGToastStyleText
@property (nonatomic, copy, readonly) ToastStyle                style;
//展示方向，默认MGToastFromDown
@property (nonatomic, copy, readonly) ToastOrientation          from;
//展示文本
@property (nonatomic, copy, readonly) ToastData                 msg;
//展示图片
@property (nonatomic, copy, readonly) ToastData                 img;
//展示延时时间，默认为0
@property (nonatomic, copy, readonly) ToastValue                delay;
//展示时长，默认为3s
@property (nonatomic, copy, readonly) ToastValue                duration;
//动画时长，默认为0.3s
@property (nonatomic, copy, readonly) ToastValue                aniTime;
//展示的圆角，不设置默认不展示圆角，纯文字Toast展示height/2圆角
@property (nonatomic, copy, readonly) ToastValue                radius;

//Toast的约束条件
//Toast距离下发的位置
@property (nonatomic, copy, readonly) ToastValue                bottom;
//Toast距离上方的位置，bottom与top只需要设置一个值即可
@property (nonatomic, copy, readonly) ToastValue                top;
@property (nonatomic, copy, readonly) ToastValue                hmin;//横屏下最小宽度。取值范围0-1，默认为0.3
@property (nonatomic, copy, readonly) ToastValue                hmax;//横屏下最大宽度，取值范围0-1，默认为0.8
@property (nonatomic, copy, readonly) ToastValue                vmin;//竖屏下最小宽度，取值返回0-1，默认为0.5
@property (nonatomic, copy, readonly) ToastValue                vmax;//竖屏下最大宽度，取值返回0-1，默认为0.8

//开始展示
@property (nonatomic, copy, readonly) ToastEnd                  end;

/**
 直接展示Toast全文字的方法

 @param toastMessage toast内容
 */
+ (void)showToast:(NSString*)toastMessage;

@end



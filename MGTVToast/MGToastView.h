//
//  MGToastView.h
//  ToastDemo
//
//  Created by cyzcj on 2017/9/28.
//  Copyright © 2017年 cyzcj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MGToastStyleLabel
} MGToastStyle;

typedef enum : NSUInteger {
    MGToastFromDown,
    MGToastFromUp
} MGToastOrientation;

@class MGToastModel;

@interface MGToastView : UIView

+ (void)showToast:(MGToastModel*)toastModel;

@end

@interface MGToastModel : NSObject

@property (nonatomic, assign) CGFloat               delay;
@property (nonatomic, assign) CGFloat               duration;
@property (nonatomic, assign) CGFloat               cornerRadius;
@property (nonatomic, assign) CGFloat               bottomSpace;
@property (nonatomic, assign) CGFloat               topSpace;
@property (nonatomic, assign) CGFloat               animationTime;

@property (nonatomic, assign) CGFloat               hmin;
@property (nonatomic, assign) CGFloat               hmax;
@property (nonatomic, assign) CGFloat               vmin;
@property (nonatomic, assign) CGFloat               vmax;

@property (nonatomic, copy) NSString                *message;
@property (nonatomic, copy) NSString                *imgName;

@property (nonatomic, assign) MGToastStyle          style;
@property (nonatomic, assign) MGToastOrientation    orientation;

@end

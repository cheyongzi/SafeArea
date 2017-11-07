//
//  MGToast.m
//  TestDemo
//
//  Created by Che Yongzi on 2017/9/26.
//  Copyright © 2017年 Che Yongzi. All rights reserved.
//

#import "MGToast.h"

@interface MGToast ()

@property (nonatomic, strong) MGToastModel          *toastModel;

@end

@implementation MGToast

#pragma mark - StartInit
static ToastInit _start = nil;

+ (ToastInit)start {
    if (_start == nil) {
        NSLog(@"_start is nil");
        _start = ^MGToast*() {
            MGToast *toast = [[MGToast alloc] init];
            toast.toastModel = [[MGToastModel alloc] init];
            return toast;
        };
    }
    return _start;
}

+ (void)setStart:(ToastInit)start {
    if (start != _start) {
        _start = [start copy];
    }
}

#pragma mark - Style
- (ToastStyle)style {
    ToastStyle showStyle = ^MGToast*(MGToastStyle style) {
        self.toastModel.style = style;
        return self;
    };
    return showStyle;
}

#pragma mark - Message
- (ToastData)msg {
    ToastData msgData = ^MGToast*(NSString *data) {
        self.toastModel.message = data;
        return self;
    };
    return msgData;
}

#pragma mark - Image
- (ToastData)img {
    ToastData imgData = ^MGToast*(NSString *data) {
        self.toastModel.imgName = data;
        return self;
    };
    return imgData;
}

#pragma mark - Duration
- (ToastValue)duration {
    ToastValue tostDuration = ^MGToast*(CGFloat time) {
        self.toastModel.duration = time;
        return self;
    };
    return tostDuration;
}

#pragma mark - Delay
- (ToastValue)delay {
    ToastValue tostDelay = ^MGToast*(CGFloat time) {
        self.toastModel.delay = time;
        return self;
    };
    return tostDelay;
}

#pragma mark - Orientation
- (ToastOrientation)from {
    ToastOrientation toastOrientation = ^MGToast*(MGToastOrientation orientation) {
        self.toastModel.orientation = orientation;
        return self;
    };
    return toastOrientation;
}

#pragma mark - radius
- (ToastValue)radius {
    ToastValue toastRadius = ^MGToast*(CGFloat radius) {
        self.toastModel.cornerRadius = radius;
        return self;
    };
    return toastRadius;
}

#pragma mark - bottom
- (ToastValue)bottom {
    ToastValue toastBottom = ^MGToast*(CGFloat space) {
        self.toastModel.bottomSpace = space;
        return self;
    };
    return toastBottom;
}

#pragma mark - Top
- (ToastValue)top {
    ToastValue toastTop = ^MGToast*(CGFloat space) {
        self.toastModel.topSpace = space;
        return self;
    };
    return toastTop;
}

#pragma mark - AnimationTime
- (ToastValue)aniTime {
    ToastValue toastAnimation = ^MGToast*(CGFloat time) {
        self.toastModel.animationTime = time;
        return self;
    };
    return toastAnimation;
}

#pragma mark - 设置Toast横屏下最小和最大宽度
- (ToastValue)hmin {
    ToastValue hminScale = ^MGToast*(CGFloat scale) {
        self.toastModel.hmin = scale;
        return self;
    };
    return hminScale;
}

- (ToastValue)hmax {
    ToastValue hmaxScale = ^MGToast*(CGFloat scale) {
        self.toastModel.hmax = scale;
        return self;
    };
    return hmaxScale;
}

#pragma mark - 设置Toast竖屏下最小和最大宽度
- (ToastValue)vmin {
    ToastValue vminScale = ^MGToast*(CGFloat scale) {
        self.toastModel.vmin = scale;
        return self;
    };
    return vminScale;
}

- (ToastValue)vmax {
    ToastValue vmaxScale = ^MGToast*(CGFloat scale) {
        self.toastModel.vmax = scale;
        return self;
    };
    return vmaxScale;
}

#pragma mark - End
- (ToastEnd)end {
    ToastEnd end = ^void() {
        [MGToastView showToast:self.toastModel];
    };
    return end;
}

#pragma mark - ShowToastMessage
+ (void)showToast:(NSString *)toastMessage {
    MGToast.start().msg(toastMessage).end();
}

#pragma mark - Dealloc
- (void)dealloc {
    _start = nil;
    NSLog(@"MGToast dealloc");
}

@end

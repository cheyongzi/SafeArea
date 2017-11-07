//
//  MGToastView.m
//  ToastDemo
//
//  Created by cyzcj on 2017/9/28.
//  Copyright © 2017年 cyzcj. All rights reserved.
//

#import "MGToastView.h"
#import "MGToastLabel.h"
#import "Masonry.h"

@interface MGToastView()
//表示进入方向的约束条件
@property (nonatomic, strong) MASConstraint                 *orientationConstraint;

@property (nonatomic, strong) MGToastModel                  *toastModel;

@end

@implementation MGToastView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        self.layer.masksToBounds = YES;
    }
    return self;
}


- (void)layoutSubviews{
    if (self.toastModel.cornerRadius > 0) {
        self.layer.cornerRadius = self.toastModel.cornerRadius;
        return;
    }
    switch (self.toastModel.style) {
        case MGToastStyleLabel:
            self.layer.cornerRadius = self.bounds.size.height/2;
            break;
        default:
            break;
    }
}

+ (void)showToast:(MGToastModel *)toastModel {
    MGToastView *toastView = [[MGToastView alloc] init];
    if (toastModel.style == MGToastStyleLabel) {
        MGToastLabel *label = [MGToastLabel toastLabel:toastModel];
        [toastView addSubview:label];
    }
    [[[UIApplication sharedApplication] keyWindow] addSubview:toastView];
    
    if (!toastView.superview) {
        return;
    }
    toastView.toastModel = toastModel;
    
    [toastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(toastView.superview);
        switch (toastModel.orientation) {
            case MGToastFromDown:
                toastView.orientationConstraint = make.top.equalTo(toastView.superview.mas_bottom);
                break;
            case MGToastFromUp:
                toastView.orientationConstraint = make.bottom.equalTo(toastView.superview.mas_top);
                break;
            default:
                break;
        }
    }];
    
    [toastView startAnimation];
}

- (void)startAnimation {
    [self.superview layoutIfNeeded];
    [self.orientationConstraint uninstall];
    [UIView animateWithDuration:self.toastModel.animationTime delay:self.toastModel.delay usingSpringWithDamping:0.65 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.toastModel.bottomSpace != 0) {
                make.bottom.equalTo(self.superview).with.offset(-self.toastModel.bottomSpace);
            } else if (self.toastModel.topSpace != 0) {
                make.top.equalTo(self.superview).with.offset(self.toastModel.topSpace);
            } else {
                make.bottom.equalTo(self.superview).with.offset(-100);
            }
        }];
        
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:self.toastModel.duration options:UIViewAnimationOptionCurveLinear animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

- (CGSize)intrinsicContentSize {
    return CGSizeZero;
}

- (void)dealloc {
    NSLog(@"MGToastView dealloc");
}

@end

@implementation MGToastModel

- (id)init {
    if (self = [super init]) {
        self.duration = 3;
        self.animationTime = 0.3;
        
        self.hmin = 0.3;
        self.hmax = 0.8;
        
        self.vmin = 0.5;
        self.vmax = 0.8;
    }
    return self;
}

@end

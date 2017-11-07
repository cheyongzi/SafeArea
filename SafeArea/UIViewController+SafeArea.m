//
//  UIViewController+SafeArea.m
//  AutoLayout
//
//  Created by cyzcj on 2017/10/26.
//

#import "UIViewController+SafeArea.h"
#import <objc/runtime.h>
#import "Masonry.h"

static const void *ContentView = &ContentView;

@implementation UIViewController (SafeArea)

- (void)setContentView:(UIView *)contentView {
    objc_setAssociatedObject(self, ContentView, contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)contentView {
    UIView *view = objc_getAssociatedObject(self, ContentView);
    if (!view) {
        view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        self.contentView = view;
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                self.automaticallyAdjustsScrollViewInsets = NO;
                make.top.equalTo(self.mas_topLayoutGuide);
                make.bottom.equalTo(self.mas_bottomLayoutGuide);
            }
        }];
    }
    return view;
}

@end

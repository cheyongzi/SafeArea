//
//  MGToastLabel.m
//  ToastDemo
//
//  Created by cyzcj on 2017/9/29.
//  Copyright © 2017年 cyzcj. All rights reserved.
//

#import "MGToastLabel.h"
#import "MGToastView.h"
#import "Masonry.h"

@interface MGToastLabel()

@property (nonatomic, strong) MGToastModel  *model;

@end

@implementation MGToastLabel

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.numberOfLines = 0;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.superview) {
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.superview).with.insets(UIEdgeInsetsMake(10, 10, 8, 10));
            make.height.greaterThanOrEqualTo(@25);
            if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
                make.width.lessThanOrEqualTo([UIApplication sharedApplication].keyWindow).multipliedBy(self.model.hmax);
                make.width.greaterThanOrEqualTo([UIApplication sharedApplication].keyWindow).multipliedBy(self.model.hmin);
            }else if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
                make.width.lessThanOrEqualTo([UIApplication sharedApplication].keyWindow).multipliedBy(self.model.vmax);
                make.width.greaterThanOrEqualTo([UIApplication sharedApplication].keyWindow).multipliedBy(self.model.vmin);
            }else {
                make.width.lessThanOrEqualTo([UIApplication sharedApplication].keyWindow).multipliedBy(self.model.vmax);
                make.width.greaterThanOrEqualTo([UIApplication sharedApplication].keyWindow).multipliedBy(self.model.vmin);
            }
        }];
    }
}

+ (MGToastLabel *)toastLabel:(MGToastModel *)model {
    MGToastLabel *label = [[MGToastLabel alloc] init];
    label.model = model;
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:15],
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                                  };
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:model.message attributes:attr];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [paragraphStyle setLineSpacing:5];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, model.message.length)];
    
    [label setAttributedText:attributedString];
    
    [label sizeToFit];
    return label;
}

- (void)dealloc {
    NSLog(@"MGToastLabel dealloc");
}

@end

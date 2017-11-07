//
//  MGToastLabel.h
//  ToastDemo
//
//  Created by cyzcj on 2017/9/29.
//  Copyright © 2017年 cyzcj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MGToastModel;

@interface MGToastLabel : UILabel

+ (MGToastLabel*)toastLabel:(MGToastModel*)model;

@end

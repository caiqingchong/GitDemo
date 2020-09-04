//
//  SuspensionView.h
//  TestDemo
//
//  Created by mac on 2020/8/20.
//  Copyright © 2020 zhangkai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuspensionView : UIView

@property (nonatomic,copy) void(^suspensionBlock)(void);
@property (nonatomic,strong) UILabel *peasLabel;


@end

NS_ASSUME_NONNULL_END

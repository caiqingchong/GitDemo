//
//  SuspensionView.m
//  TestDemo
//
//  Created by mac on 2020/8/20.
//  Copyright © 2020 zhangkai. All rights reserved.
//

#import "SuspensionView.h"

@implementation SuspensionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *BGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height)];
        BGView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        [self addSubview:BGView];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake((self.window.bounds.size.width-270)/2, 248, 270, 171)];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 15;
        [BGView addSubview:view];
        
        UIImageView *rightImg = [[UIImageView alloc]initWithFrame:CGRectMake(60.5, 32.5, 20, 20)];
        rightImg.image = [UIImage imageNamed:@""];
        [view addSubview:rightImg];
        
         UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(83, 32.5, 180, 25)];
               label.text = @"本次任务已完成";
               label.font = [UIFont fontWithName:@"PingFangSC" size: 18];
               [view addSubview:label];
               
               UIImageView *peasImg = [[UIImageView alloc]initWithFrame:CGRectMake(109, 90+12, 30.5, 29)];
               peasImg.image = [UIImage imageNamed:@"peas.png"];
               [view addSubview:peasImg];
               
               _peasLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, 90+14, 50, 25)];
               _peasLabel.text = @"+3";
               _peasLabel.font = [UIFont fontWithName:@"PingFangSC" size: 18];
               _peasLabel.textAlignment = NSTextAlignmentLeft;
               [view addSubview:_peasLabel];
        
        UIButton *knowBut = [UIButton buttonWithType:0];
        knowBut.frame = CGRectMake(20, 20, 230, 35);
        knowBut.layer.cornerRadius = 17.5;
        [knowBut setTitle:@"知道了" forState:UIControlStateNormal];
        [knowBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        knowBut.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        [knowBut addTarget:self action:@selector(knowSelect) forControlEvents:UIControlEventTouchUpInside];
        
      
    }
    return self;
}

- (void)knowSelect{
    
    if (_suspensionBlock) {
        _suspensionBlock();
    }
    
}



@end

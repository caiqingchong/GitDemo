//
//  ViewController.m
//  TestDemo
//
//  Created by mac on 2020/8/4.
//  Copyright © 2020 zhangkai. All rights reserved.
//

#import "ViewController.h"
#import "SuspensionView.h"
@interface ViewController ()
@property (nonatomic,retain) UIImageView *imgView;
@end

@implementation ViewController
//能不能在为你跳支舞
- (void)viewDidLoad {
    [super viewDidLoad];
 
    UIButton *_changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _changeBtn.frame = CGRectMake(100, 322.5, 48, 24);
    [_changeBtn setTitle:@"修改" forState:UIControlStateNormal];
    _changeBtn.backgroundColor = [UIColor redColor];
    _changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_changeBtn addTarget:self action:@selector(changeMyCommentOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_changeBtn];
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 350, 19, 19)];
    _imgView.image = [UIImage imageNamed:@"img_0.png"];
    [self.view addSubview:_imgView];    
    //判断当前日期是否属今年
    double time = 1566268369000;
    NSLog(@"[self timeDate:time]:%@",[self timeDate:time]);
    
    
}
- (void)changeMyCommentOne{
    SuspensionView *sus = [[SuspensionView alloc] initWithFrame:CGRectMake(0, 0, self.view.window.bounds.size.width, self.view.window.bounds.size.height)];
    [self.view addSubview:sus];
}


- (void)changeMyComment{
    NSMutableArray <UIImage *> *imgArr = [[NSMutableArray alloc]init];
    NSArray *arrImg = @[@"img_0.png",@"img_1.png",@"img_2.png"];
    for (int i=0; i<arrImg.count; i++) {
        UIImage *img = [UIImage imageNamed:arrImg[i]];
        [imgArr addObject:img];
    }
    _imgView.animationImages = imgArr;
    _imgView.animationDuration = 0.5;
    _imgView.animationRepeatCount = 1;
    [_imgView startAnimating];
    _imgView.image = [UIImage imageNamed:arrImg[2]];
}

/**
 *  @return 刚刚  几分钟前  几小时前  几天前  fromat
 */
-(NSString *)timeDate:(double)date {
    if (date) {
        double msgtime = date/1000;
        NSDate *date_now = [NSDate date];
        double nowtime = [date_now timeIntervalSince1970];
        
        double timePoor = nowtime - msgtime;
        NSLog(@"~~~~~~~~~~nowtime:%lf~~~~~msgtime:%lf",nowtime,msgtime);
        if (timePoor > 0) {
            NSString *showTime;
            if (timePoor < 60) {
                showTime = [NSString stringWithFormat:@"%.0f秒前", timePoor];
            } else if(timePoor < 60 * 60) {
                double a = timePoor / 60.0;
                showTime = [NSString stringWithFormat:@"%.0f分钟前", floor(a)];
            } else if(timePoor < 24 * 60 * 60) {
                double a = timePoor / (60.0 * 60.0);
                showTime = [NSString stringWithFormat:@"%.0f小时前",floor(a)];
            } else if (timePoor > 24 * 60 * 60) {
                NSDate *oldTimeDate = [NSDate dateWithTimeIntervalSince1970:msgtime];

                NSDateFormatter *formatterOld = [[NSDateFormatter alloc] init];
                [formatterOld setDateFormat:@"yyyy"];
                NSString *oldYear = [formatterOld stringFromDate:oldTimeDate];
                
                [formatterOld setDateFormat:@"yyyy"];
                NSString *currentYear=[formatterOld stringFromDate:date_now];
                NSLog(@"~~~~~~~~~~oldYear:%@,currentYear：%@",oldYear,currentYear);
                if ([oldYear isEqualToString:currentYear]) {
                    [formatterOld setDateFormat:@"MM月dd日 HH:mm"];
                    return [formatterOld stringFromDate:oldTimeDate];
                }else{
                    [formatterOld setDateFormat:@"YYYY年MM月dd日 HH:mm"];
                    return [formatterOld stringFromDate:oldTimeDate];
                }
            }
            
            return showTime;
        } else {
            return @"刚刚";
        }
    }else{
        return @"刚刚";
    }
}


- (NSDateComponents *)getNowDateComponents{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:[NSDate date]];
    return comps;
}

/**
 今天凌晨12点timeInteval

 @return 时间戳
 */
- (NSTimeInterval)todayZeroTimeInterval {
    NSDateComponents *todayCom = [self getNowDateComponents];
    [todayCom setHour:0];
    [todayCom setMinute:0];
    [todayCom setSecond:0];
    NSTimeInterval timeInteval = [[[NSCalendar currentCalendar] dateFromComponents:todayCom] timeIntervalSince1970];
    
    return timeInteval;
}




@end

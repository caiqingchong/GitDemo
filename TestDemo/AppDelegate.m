//
//  AppDelegate.m
//  TestDemo
//
//  Created by mac on 2020/8/4.
//  Copyright © 2020 zhangkai. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
   
   
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
       NSTimeInterval a=[dat timeIntervalSince1970];
       NSString *timeString = [NSString stringWithFormat:@"%0.0f", a];//转为字符型
    NSLog(@"timeString:%lld",[timeString longLongValue]*1000);
    
    long abc = 9999;
    double eee = (double)abc;
    NSLog(@"~~~~~~~~~~~abc:%ld~~~~eee:%f",abc,eee);
    
    NSMutableArray *mutImagesArry = [[NSMutableArray alloc]init];
         NSArray *aar = nil;
         [mutImagesArry addObjectsFromArray:aar];
         NSLog(@"~~~~~~~~~~mutImagesArry:%@",mutImagesArry);
    
    NSArray *bbr = @[@"1122",@"125",@"2229",@"501"];
    [mutImagesArry addObjectsFromArray:bbr];
    NSLog(@"~~~~~~~~~~mutImagesArry:%@",mutImagesArry);
    
    NSDictionary *dic = @{@"1":@"11111",@"4":@"44444",@"3":@"33333",@"2":@"22222",@"5":@"55555"};
    NSLog(@"~~~~~~~~~key:%@~~~~~~~~~value:%@",dic.allKeys,dic.allValues);
    NSMutableArray *keyArr = [[NSMutableArray alloc]init];
    [keyArr addObjectsFromArray:dic.allKeys];
    for (int i=0; i< keyArr.count; i++) {
        for (int j=i+1; j<keyArr.count; j++) {
            if ([keyArr[i] intValue]>[keyArr[j] intValue]) {
                [keyArr exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"~~~~~~~~~选择排序key：%@",keyArr);
    NSMutableArray *valueArr = [[NSMutableArray alloc]init];
    for (int i=0; i<keyArr.count; i++) {
        [valueArr addObject:[dic objectForKey:keyArr[i]]];
    }
    NSLog(@"~~~~~~~~valuearr:%@",valueArr);
    
    
    
    NSString *space = @"      ";
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [space stringByTrimmingCharactersInSet:set];
    if ([trimedString length] == 0) {
        NSLog(@"~~~~~~~~~~quan不都是空格o");
    }

    NSDictionary *dic1 = @{@"name":@"zhang"};
    NSLog(@"~~~~~~~~~~字典：%@",[dic1 objectForKey:@"aaa"]);
    
    
    NSArray *meArr  = nil;
    NSLog(@"meArrde coiunt:%lu",(unsigned long)meArr.count);
    
    NSArray *aaa = @[@"1",@"2"];
    NSArray *ccc = @[@"555",@"666"];
    NSArray *bbb = [NSArray new];
    bbb = aaa;
    NSLog(@"1111~~~~~bbb:%@",bbb);
    bbb = nil;
    bbb = ccc;
    NSLog(@"222~~~~~bbb:%@",bbb);
    
    NSMutableDictionary *changeDic = [NSMutableDictionary dictionaryWithCapacity:1];
   [changeDic setValue:@"修改" forKey:@"s0"];
   NSDictionary *ectDic = [NSDictionary dictionaryWithObject:changeDic forKey:@"etc"];
    NSLog(@"~~~~~~~~~~~~~~ectDic:%@",ectDic);
    NSString *ssss = @"123";
    if (ssss) {
        NSLog(@"~~~~~~~ssss:%@",ssss);
    }
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end

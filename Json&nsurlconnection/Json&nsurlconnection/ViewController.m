//
//  ViewController.m
//  Json&nsurlconnection
//
//  Created by 李明禄 on 15/12/6.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/adat/sk/101291301.html"];
    
    NSURLRequest  *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:10.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        
        // JSON - 将`二进制数据`转换成`字典` 数据解析，`反序列化`
        /**
         NSJSONReadingMutableContainers = (1UL << 0),   容器可变
         NSJSONReadingMutableLeaves = (1UL << 1),       叶子可变
         NSJSONReadingAllowFragments(碎片) = (1UL << 2)  顶级节点，可以不是数组或者字典
         
         直接做字典转模型，不关心节点变化，位移枚举传入0，效率最高！
         */

        NSLog(@"%@",dict);
        
        NSLog(@"%@", dict[@"weatherinfo"][@"city"]);
    }];
}

@end

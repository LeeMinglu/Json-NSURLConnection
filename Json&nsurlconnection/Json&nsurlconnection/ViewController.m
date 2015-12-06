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
        
        NSLog(@"%@",dict);
    }];
}

@end

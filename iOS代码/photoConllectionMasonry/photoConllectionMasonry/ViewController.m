//
//  ViewController.m
//  photoConllectionMasonry
//
//  Created by robert on 2016/12/25.
//  Copyright © 2016年 ZJS. All rights reserved.
//

#import "ViewController.h"
#import "JSView.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self masonryPadding];
    
    JSView *jsView = [[JSView alloc] init];
    jsView.frame = CGRectMake(0, 0, 300, 300);
    [self.view addSubview:jsView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)masonryPadding{
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    UIView *superview = self.view;
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addSubview:view1];
    
    //一
    /*
     [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(superview.mas_top).with.offset(padding.top); //with is an optional semantic filler
     make.left.equalTo(superview.mas_left).with.offset(padding.left);
     make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
     make.right.equalTo(superview.mas_right).with.offset(-padding.right);
     }];
     */
    
    //二
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superview).with.insets(padding);
    }];

}


@end

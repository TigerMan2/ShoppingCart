//
//  ViewController.m
//  ShoppingCart
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingCartViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 40)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

-(void)button{


    ShoppingCartViewController *shoppingcart = [[ShoppingCartViewController alloc] init];
    UINavigationController *hom1Navi = [[UINavigationController alloc]initWithRootViewController:shoppingcart];
    [self presentViewController:hom1Navi animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end

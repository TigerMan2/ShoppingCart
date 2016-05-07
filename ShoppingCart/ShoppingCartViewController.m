//
//  ShoppingCartViewController.m
//  TDS
//
//  Created by 黎金 on 16/3/24.
//  Copyright © 2016年 sixgui. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "Util.h"
#import "Header.h"
#import "ShoppingTableView.h"
#import "ShoppingModel.h"
@interface ShoppingCartViewController ()
{

    BOOL isbool;
    
    BOOL editbool;
    
    NSString *numString;
    
    ShoppingTableView *shopping;
    
    NSArray *cellArray;
}
@end

@implementation ShoppingCartViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self setInit];
}

-(void)setInit{

    numString = @"0";
    [Util setFoursides:_bottomView Direction:@"top" sizeW:SCREEN_WIDTH];
    [Util setFoursides:_naviView Direction:@"bottom" sizeW:SCREEN_WIDTH];
    
    shopping = [[ShoppingTableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 -50) style:UITableViewStyleGrouped];
    [self.view addSubview:shopping];
    
    [self setData];
    
    //接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AllPrice:) name:@"AllPrice" object:nil];
     [Util setUILabel:_allPriceLabel Data:@"总价: " SetData:@"￥0.00" Color:BACKGROUNDCOLOR Font:15 Underline:NO];
  
}

#pragma mark 通知
- (void)AllPrice:(NSNotification *)text{

    _allPriceLabel.text = [NSString stringWithFormat:@"总价: %@",text.userInfo[@"allPrice"]];
     [Util setUILabel:_allPriceLabel Data:@"总价: " SetData:text.userInfo[@"allPrice"] Color:BACKGROUNDCOLOR Font:15 Underline:NO];
    
    numString = text.userInfo[@"num"];
    
    [self setTlementLabel];
    [self setAllBtnState:[text.userInfo[@"allState"]  isEqual: @"YES"]?NO:YES];
    
    cellArray =  text.userInfo[@"cellModel"];
}

#pragma mark 设置结算按钮状态
-(void)setTlementLabel{

    NSString *string = editbool?@"删除":@"结算";
    _settlementLabel.text = [NSString stringWithFormat:@"%@(%@)",string,numString];
}

#pragma mark 数据
-(void)setData{

   
    NSDictionary *dicts = @{
                            @"item":@[
                                @{
                                    @"headID":@"10",
                                    @"headState":@1,
                                    @"discount":@"9",
                                    @"headCellArray":@[
                                            @{
                                                @"imageUrl":@"headurl.png",
                                                @"title":@"韩版宽松杂色马海毛休闲",
                                                @"color":@"浅蓝",
                                                @"size":@"s",
                                                @"price":@"100.00",
                                                @"numInt":@2,
                                                @"inventoryInt":@10,
                                                @"mustInteger":@1,
                                                @"ID":@"10",
                                                },
                                            @{
                                                
                                                @"imageUrl":@"headurl.png",
                                                @"title":@"韩版宽松杂色马海毛休闲",
                                                @"color":@"浅蓝",
                                                @"size":@"s",
                                                @"price":@"100.00",
                                                @"numInt":@2,
                                                @"inventoryInt":@10,
                                                @"mustInteger":@1,
                                                @"ID":@"11",
                                                },
                                            @{
                                                
                                                @"imageUrl":@"headurl.png",
                                                @"title":@"韩版宽松杂色马海毛休闲",
                                                @"color":@"浅蓝",
                                                @"size":@"s",
                                                @"price":@"100.00",
                                                @"numInt":@2,
                                                @"inventoryInt":@10,
                                                @"mustInteger":@0,
                                                @"ID":@"12",
                                                },
                                            ]
                                        
                                    },
                                @{
                                    @"headID":@"11",
                                    @"headState":@1,
                                    @"discount":@"9",
                                    @"headCellArray":@[
                                            @{
                                                @"imageUrl":@"headurl.png",
                                                @"title":@"韩版宽松杂色马海毛休闲",
                                                @"color":@"浅蓝",
                                                @"size":@"s",
                                                @"price":@"100.00",
                                                @"numInt":@2,
                                                @"inventoryInt":@10,
                                                @"mustInteger":@1,
                                                @"ID":@"13",
                                                },
                                            @{
                                                
                                                @"imageUrl":@"headurl.png",
                                                @"title":@"韩版宽松杂色马海毛休闲",
                                                @"color":@"浅蓝",
                                                @"size":@"s",
                                                @"price":@"100.00",
                                                @"numInt":@2,
                                                @"inventoryInt":@10,
                                                @"mustInteger":@0,
                                                @"ID":@"14",
                                                },
                                            ]
                                    
                                    },
                                @{
                                    @"headID":@"10",
                                    @"headState":@0,
                                    @"discount":@"9",
                                    @"headCellArray":@[
                                            @{
                                                @"imageUrl":@"headurl.png",
                                                @"title":@"韩版宽松杂色马海毛休闲",
                                                @"color":@"浅蓝",
                                                @"size":@"s",
                                                @"price":@"100.00",
                                                @"numInt":@2,
                                                @"inventoryInt":@10,
                                                @"mustInteger":@0,
                                                @"ID":@"15",
                                                },
                            
                                            ]
                                    
                                    },
                                @{
                                    @"headID":@"10",
                                    @"headState":@0,
                                    @"discount":@"9",
                                    @"headCellArray":@[
                                            @{
                                                @"imageUrl":@"headurl.png",
                                                @"title":@"韩版宽松杂色马海毛休闲",
                                                @"color":@"浅蓝",
                                                @"size":@"s",
                                                @"price":@"100.00",
                                                @"numInt":@2,
                                                @"inventoryInt":@10,
                                                @"mustInteger":@0,
                                                @"ID":@"16",
                                                },
                                            
                                            ]
                                    
                                    },
                                
                                
                                ]
                            };
    
    
    NSMutableArray *arrayl = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in dicts[@"item"]) {
        
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        ShoppingModel *model = [[ShoppingModel alloc] initWithShopDict:dict];
        [dictarray addObject:model];
        
        [arrayl addObject:model];
        
    }
    
    shopping.shoppingArray = arrayl;
    
}

#pragma mark 编辑
- (IBAction)EditBtn:(UIButton *)sender {

    if (editbool) {
        
        [shopping editBtn:editbool];
        editbool = NO;
    }else{
    
        
        [shopping editBtn:editbool];
        editbool = YES;
    }
    
    [_editLabel setTitle:editbool?@"完成":@"编辑" forState:UIControlStateNormal];
    [self setTlementLabel];
    _allPriceLabel.hidden = editbool;
    
}

#pragma mark 返回
- (IBAction)ReturnBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma 全选
- (IBAction)AllBtn:(UIButton *)sender {
    
    [shopping allBtn:!isbool];
}

#pragma mark 全选
-(void)setAllBtnState:(BOOL)_bool{

    if (_bool) {
        
        _allImage.image = [UIImage imageNamed:@"iconfont-yuanquan"];
        isbool = NO;
        
    }else{
        
        _allImage.image = [UIImage imageNamed:@"iconfont-zhengque"];
        isbool = YES;
    }
}

#pragma mark 结算
- (IBAction)SettlementBtn:(UIButton *)sender {
    
    if (editbool) {
        
        [shopping deleteBtn:editbool];
        
    }else{
    
        
        NSLog(@"结算:%@",cellArray);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end

//
//  ViewController.m
//  PopDemo
//
//  Created by artios on 2017/3/23.
//  Copyright © 2017年 artios. All rights reserved.
//

#import "ViewController.h"
#import "MMPopverView.h"

@interface ViewController ()<MMPopverViewDelegate>

@property (nonatomic, strong) UIButton *sender;

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray      *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti) name:MMPopviewDissmissNotification object:nil];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(200, 200, 200, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"unselected" forState:UIControlStateNormal];
    [button setTitle:@"selected" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.dataArray = @[@"1111",@"2222",@"3333",@"4444",@"5555",];
    
    
}

- (void)buttonAction:(UIButton *)sender{
    
    self.sender = sender;
    
    sender.selected = !sender.selected;
    
    MMPopverView *popView = [MMPopverView popoverView];
    [popView showToView:sender itemArray:self.dataArray selectIndex:2 delegate:self];
    
}

- (void)noti{
    
    self.sender.selected = NO;
    
}

- (void)MMPopverView:(MMPopverView *)popverView selectedIndex:(NSInteger)index{
    NSLog(@">>>>>>>>>>>delegate index %lu",index);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

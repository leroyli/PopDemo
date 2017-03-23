//
//  MMPopverView.h
//  TextFieldDemo
//
//  Created by artios on 2017/3/23.
//  Copyright © 2017年 artios. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const MMPopviewDissmissNotification = @"MMPopviewDissmissNotification";

@class MMPopverView;
@protocol MMPopverViewDelegate <NSObject>

- (void)MMPopverView:(MMPopverView *)popverView selectedIndex:(NSInteger)index;

@end

@interface MMPopverView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, assign) BOOL hideAfterTouchOutside;
@property (nonatomic, assign) BOOL showShade;
@property (nonatomic, weak  ) id<MMPopverViewDelegate> delegate;

+ (instancetype)popoverView;

- (void)showToView:(UIView *)pointView;

- (void)showToPoint:(CGPoint)toPoint;

- (void)showToView:(UIView *)pointView
         itemArray:(NSArray *)itemArray
       selectIndex:(NSInteger)selectindex
          delegate:(id<MMPopverViewDelegate>)delegate;

- (void)showToPoint:(CGPoint)toPoint
          itemArray:(NSArray *)itemArray
        selectIndex:(NSInteger)selectindex
           delegate:(id<MMPopverViewDelegate>)delegate;

- (void)hide;

@end

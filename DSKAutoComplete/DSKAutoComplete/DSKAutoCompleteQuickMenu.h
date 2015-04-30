//
//  DSKAutoCompleteQuickMenu.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DSKQuicklyMenuHeight 90

typedef enum {
    DSKAutoCompleteStyleDropDown,
    DSKAutoCompleteStyleKeyboard,
} DSKAutoCompleteStyle;

@protocol DSKAutoCompleteQuickMenuDelegate;

@interface DSKAutoCompleteQuickMenu : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id <DSKAutoCompleteQuickMenuDelegate> delegate;
@property (nonatomic, strong) UITableView *quickMenu;

- (void)tableviewWithStyle:(DSKAutoCompleteStyle)style;
- (UITextField *)currentTextField;
- (void)show;
- (void)hidden;
- (void)refreshDataUsing:(NSDictionary *)dataSource;
@end

@protocol DSKAutoCompleteQuickMenuDelegate <NSObject>
@required
- (void)tableViewDidSelect:(NSString *)selectString;

@end

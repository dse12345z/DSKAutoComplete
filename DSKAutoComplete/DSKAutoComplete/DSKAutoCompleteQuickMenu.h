//
//  DSKAutoCompleteQuickMenu.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DSKQuicklyMenuHeight 90

@protocol DSKAutoCompleteQuickMenuDelegate;

@interface DSKAutoCompleteQuickMenu : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id <DSKAutoCompleteQuickMenuDelegate> delegate;

- (void)setTableviewWithStyle:(BOOL)isKeyboard;
- (void)tableViewDropDownAnimateHidden;
- (void)upDateReload:(NSDictionary *)dataSource;
@end

@protocol DSKAutoCompleteQuickMenuDelegate <NSObject>
@required
- (void)tableViewDidSelect:(NSString *)selectString;

@end

//
//  DSKAutoCompleteQuickMenu.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NSValue(obj) [NSValue valueWithPointer : (__bridge const void *)(obj)]
#define DSKQuicklyMenuHeight 90

@protocol DSKAutoCompleteQuickMenuDelegate;

@interface DSKAutoCompleteQuickMenu : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *respondTextField;
@property (nonatomic, strong) NSMutableDictionary *tfDictionary;
@property (nonatomic, weak) id <DSKAutoCompleteQuickMenuDelegate> delegate;

- (void)setTableviewStyleDropDown:(UITextField *)textField delegate:(id <DSKAutoCompleteQuickMenuDelegate> )delegate;
- (void)setTableviewStyleKeyboard:(UITextField *)textField delegate:(id <DSKAutoCompleteQuickMenuDelegate> )delegate;
- (void)tableViewDropDownAnimateHidden;
- (void)upDateReload;
@end

@protocol DSKAutoCompleteQuickMenuDelegate <NSObject>
@required
- (void)tableViewDidSelect:(NSString *)selectString;

@end

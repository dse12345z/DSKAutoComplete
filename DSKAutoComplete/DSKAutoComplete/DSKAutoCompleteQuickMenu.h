//
//  DSKAutoCompleteQuickMenu.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DSKAutoCompleteProtocol.h"

#define textFieldStyle  ((NSNumber *)[textField valueForKey:@"style"]).intValue
#define DSKQuicklyMenuHeight 90

@protocol DSKAutoCompleteQuickMenuDelegate;

@interface DSKAutoCompleteQuickMenu : NSObject <UITableViewDelegate, UITableViewDataSource, DSKAutoCompleteProtocol>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *respondTextField;

- (void)setTableview:(UITextField *)textField delegate:(id <DSKAutoCompleteQuickMenuDelegate> )delegate;
- (void)tableViewDropDownAnimateHidden;
- (void)upDateReload;
@end

@protocol DSKAutoCompleteQuickMenuDelegate <NSObject>
@required
- (void)tableViewDidSelect:(NSString *)selectString;

@end

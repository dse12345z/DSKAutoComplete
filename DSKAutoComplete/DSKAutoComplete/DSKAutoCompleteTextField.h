//
//  DSKAutoCompleteTextField.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSKAutoCompleteDropDownMenu.h"
#import "DSKAutoCompleteKeyboardMenu.h"

@interface DSKAutoCompleteTextField : UITextField <UITextFieldDelegate, DSKAutoCompleteQuickMenuDelegate>
@property (nonatomic, strong) NSDictionary *dataSource;
@property (nonatomic, assign) DSKAutoCompleteStyle style;
@end

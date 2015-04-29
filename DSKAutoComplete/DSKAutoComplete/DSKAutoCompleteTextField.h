//
//  DSKAutoCompleteTextField.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	DSKAutoCompleteStyleDropDown, //default
	DSKAutoCompleteStyleKeyboard,
} DSKAutoCompleteStyle;

@interface DSKAutoCompleteTextField : UITextField <UITextFieldDelegate>
@property (nonatomic, strong) NSDictionary *dataDictionary;
@property (nonatomic, assign) DSKAutoCompleteStyle style;
@end

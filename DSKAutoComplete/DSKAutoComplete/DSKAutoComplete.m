//
//  DSKAutoComplete.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import "DSKAutoComplete.h"
#import "DSKAutoCompleteQuickMenu.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface DSKAutoComplete ()

@end

@implementation DSKAutoComplete

#pragma mark - class method

+ (void)handleTextField:(UITextField *)textField {
	textField.delegate = (id <UITextFieldDelegate> )self;
	[textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

#pragma msrk - DSKAutoCompleteTableViewDelegate

+ (void)tableViewDidSelect:(NSString *)string {
	[self DSKAutoCompleteQuickMenu].respondTextField.text = string;
	[[self DSKAutoCompleteQuickMenu] upDateReload];
}

#pragma mark - UITextField Delegate

+ (void)textFieldDidBeginEditing:(UITextField *)textField {
	//textField 響應後才創建 tableView menu。
	[[self DSKAutoCompleteQuickMenu] setTableview:textField delegate:(id <DSKAutoCompleteQuickMenuDelegate> )self];
}

+ (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];

	//縮鍵盤刪除 tableView menu
	if (textFieldStyle == DSKAutoCompleteStyleDropDown) {
		[[self DSKAutoCompleteQuickMenu] tableViewDropDownAnimateHidden];
	}
	else {
		textField.inputAccessoryView = nil;
	}
	return YES;
}

+ (void)textFieldDidChange:(UITextField *)textField {
	[[self DSKAutoCompleteQuickMenu] upDateReload];
}

#pragma mark - runtime objects

+ (DSKAutoCompleteQuickMenu *)DSKAutoCompleteQuickMenu {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		objc_setAssociatedObject(self, _cmd, [DSKAutoCompleteQuickMenu new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	});
	return objc_getAssociatedObject(self, _cmd);
}

@end

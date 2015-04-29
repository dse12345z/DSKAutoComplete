//
//  DSKAutoCompleteTextField.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "DSKAutoCompleteTextField.h"
#import "DSKAutoCompleteQuickMenu.h"

@interface DSKAutoCompleteTextField ()
@property (nonatomic, strong) DSKAutoCompleteQuickMenu *quickMenu;
@end

@implementation DSKAutoCompleteTextField

#pragma mark - life cycle

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self initSetting];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self initSetting];
	}
	return self;
}

#pragma mark - prive method

- (void)initSetting {
	self.dataDictionary = [NSDictionary dictionary];
	self.style = DSKAutoCompleteStyleDropDown;

	self.quickMenu = [DSKAutoCompleteQuickMenu new];
	self.quickMenu.delegate = (id <DSKAutoCompleteQuickMenuDelegate> )self;

	self.delegate = (id <UITextFieldDelegate> )self;
	self.returnKeyType = UIReturnKeyDone;
	self.clearButtonMode = UITextFieldViewModeWhileEditing;
	self.autocorrectionType = UITextAutocorrectionTypeNo;
	[self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)resignResponder {
	[self resignFirstResponder];

	//縮鍵盤刪除 tableView menu
	if (self.style == DSKAutoCompleteStyleDropDown) {
		[self.quickMenu tableViewDropDownAnimateHidden];
	}
	else {
		self.inputAccessoryView = nil;
	}
}

#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(DSKAutoCompleteTextField *)textField {
	[self.quickMenu setTableviewWithStyle:@(self.style).boolValue];
	[self.quickMenu upDateReload:self.dataDictionary];
}

- (void)textFieldDidChange:(DSKAutoCompleteTextField *)textField {
	[self.quickMenu upDateReload:self.dataDictionary];
}

- (BOOL)textFieldShouldReturn:(DSKAutoCompleteTextField *)textField {
	[self resignResponder];
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(DSKAutoCompleteTextField *)textFiel {
	[self resignResponder];
	return YES;
}

#pragma msrk - DSKAutoCompleteTableViewDelegate

- (void)tableViewDidSelect:(NSString *)string {
	self.text = string;
	[self.quickMenu upDateReload:self.dataDictionary];
}

@end

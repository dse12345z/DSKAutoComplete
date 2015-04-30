//
//  DSKAutoCompleteTextField.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "DSKAutoCompleteTextField.h"

@interface DSKAutoCompleteTextField ()
@property (nonatomic, strong) DSKAutoCompleteQuickMenu *quickMenu;
@end

@implementation DSKAutoCompleteTextField

#pragma mark - life cycle

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self initSettings];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self initSettings];
	}
	return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"style" context:nil];
}

#pragma mark - kvo

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSNumber *newValue = change[@"new"];
    switch (newValue.integerValue) {
        case DSKAutoCompleteStyleDropDown:
            self.quickMenu = [DSKAutoCompleteDropDownMenu new];
            break;
        case DSKAutoCompleteStyleKeyboard:
            self.quickMenu = [DSKAutoCompleteKeyboardMenu new];
            break;
    }
    self.quickMenu.delegate = self;
    [self.quickMenu tableviewWithStyle:self.style];
}

#pragma mark - prive method

#pragma mark * init

- (void)initSettings {
    [self addObserver:self forKeyPath:@"style" options:NSKeyValueObservingOptionNew context:nil];
	self.dataSource = [NSDictionary dictionary];

	self.delegate = self;
	self.returnKeyType = UIReturnKeyDone;
	self.clearButtonMode = UITextFieldViewModeWhileEditing;
	self.autocorrectionType = UITextAutocorrectionTypeNo;
	[self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)resignResponder {
	[self resignFirstResponder];
    [self.quickMenu hidden];
}

#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(DSKAutoCompleteTextField *)textField {
    NSAssert(self.style, @"請先設定 style");
    [self.quickMenu show];
	[self.quickMenu refreshDataUsing:self.dataSource];
}

- (void)textFieldDidChange:(DSKAutoCompleteTextField *)textField {
	[self.quickMenu refreshDataUsing:self.dataSource];
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
	[self.quickMenu refreshDataUsing:self.dataSource];
}

@end

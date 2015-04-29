//
//  DSKAutoCompleteTextField.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "DSKAutoCompleteTextField.h"
#import "DSKAutoComplete.h"

@implementation DSKAutoCompleteTextField

- (void)willMoveToSuperview:(UIView *)newSuperview {
	if (newSuperview) {
		self.dataDictionary = [NSDictionary dictionary];
		self.style = DSKAutoCompleteStyleDropDown;
		[DSKAutoComplete handleTextField:self];
	}
}

@end

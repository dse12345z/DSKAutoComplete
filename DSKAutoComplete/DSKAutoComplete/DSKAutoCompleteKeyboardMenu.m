//
//  DSKAutoCompleteKeyboardMenu.m
//  DSKAutoComplete
//
//  Created by DaidoujiChen on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "DSKAutoCompleteKeyboardMenu.h"

@implementation DSKAutoCompleteKeyboardMenu

#pragma mark - method to override

- (void)tableviewWithStyle:(DSKAutoCompleteStyle)style {
    [super tableviewWithStyle:style];
    
    CGRect newFrame = self.currentTextField.frame;
    newFrame.size.height = DSKQuicklyMenuHeight;
    self.quickMenu.frame = newFrame;
}

- (void)show {
    self.currentTextField.inputAccessoryView = self.quickMenu;
}

- (void)hidden {
    self.currentTextField.inputAccessoryView = nil;
}

@end

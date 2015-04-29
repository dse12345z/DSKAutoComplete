//
//  DSKAutoCompleteProtocol.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	DSKAutoCompleteStyleDropDown, //default
	DSKAutoCompleteStyleKeyboard,
} DSKAutoCompleteStyle;

@protocol DSKAutoCompleteProtocol <NSObject>

@end

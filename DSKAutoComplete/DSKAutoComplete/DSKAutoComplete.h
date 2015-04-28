//
//  DSKAutoComplete.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum {
	DSKAutoCompleteStyleDropDown,
	DSKAutoCompleteStyleKeyboard,
} DSKAutoCompleteStyle;

@interface DSKAutoComplete : NSObject

+ (void)handleTextField:(UITextField *)textField withDataSource:(NSDictionary *)dictionary style:(DSKAutoCompleteStyle)style;
+ (void)cacheClear;
@end

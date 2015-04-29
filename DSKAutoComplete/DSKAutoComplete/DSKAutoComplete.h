//
//  DSKAutoComplete.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DSKAutoCompleteProtocol.h"

@interface DSKAutoComplete : NSObject <DSKAutoCompleteProtocol>
+ (void)handleTextField:(UITextField *)textField;
@end

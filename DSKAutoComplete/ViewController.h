//
//  ViewController.h
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/28.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSKAutoCompleteTextField.h"
#import "SecondViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet DSKAutoCompleteTextField *autoCompleteTextField;
@property (weak, nonatomic) IBOutlet DSKAutoCompleteTextField *autoCompleteTextField2;
@end

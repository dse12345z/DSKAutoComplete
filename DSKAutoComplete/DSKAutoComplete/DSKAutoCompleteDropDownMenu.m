//
//  DSKAutoCompleteDropDownMenu.m
//  DSKAutoComplete
//
//  Created by DaidoujiChen on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "DSKAutoCompleteDropDownMenu.h"

@implementation DSKAutoCompleteDropDownMenu

#pragma mark - method to override

- (void)tableviewWithStyle:(DSKAutoCompleteStyle)style {
    [super tableviewWithStyle:style];
    
    //按照 Style 設置 tableView
    CGRect newFrame = [self currentTextField].frame;
    newFrame.origin.y += [self currentTextField].frame.size.height - 10;
    newFrame.size.height = 0;
    self.quickMenu.frame = newFrame;
    
    [[self currentTextField].superview insertSubview:self.quickMenu belowSubview:[self currentTextField]];
}

- (void)show {
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.2f
                          delay:0.0f
         usingSpringWithDamping:0.2f    //0.0f ~ 1.0f，數值越小，彈簧振幅越大。
          initialSpringVelocity:15.0f   //數值越大移動速度越快。
                        options:UIViewAnimationOptionCurveEaseOut
                     animations: ^{
                         CGRect newFrame = weakSelf.quickMenu.frame;
                         newFrame.size.height = DSKQuicklyMenuHeight;
                         weakSelf.quickMenu.frame = newFrame;
                     }
                     completion: ^(BOOL finished) {
                     }];
}

- (void)hidden {
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.2
                     animations: ^{
                         CGRect newFrame = weakSelf.quickMenu.frame;
                         newFrame.size.height = 0;
                         weakSelf.quickMenu.frame = newFrame;
                     }
                     completion: ^(BOOL finished) {
                     }];
}

@end

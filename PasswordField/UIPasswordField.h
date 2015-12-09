//
//  UIPasswordField.h
//  PasswordField
//
//  Created by 戚小建 on 15/12/9.
//  Copyright © 2015年 jianke. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIPasswordFieldDelegate <NSObject>

- (void)didEnterPassword;

@end

@interface UIPasswordField : UITextField<UITextFieldDelegate>

@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) id<UIPasswordFieldDelegate> passwordDelegate;


@end

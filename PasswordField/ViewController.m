//
//  ViewController.m
//  PasswordField
//
//  Created by 戚小建 on 15/12/9.
//  Copyright © 2015年 jianke. All rights reserved.
//

#import "ViewController.h"
#import "UIPasswordField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPasswordField *passwordField = [[UIPasswordField alloc] initWithFrame:CGRectMake(20, 100, 280, 50)];
    passwordField.length = 6;
    [self.view addSubview:passwordField];
    
    [passwordField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

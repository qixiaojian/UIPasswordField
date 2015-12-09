//
//  UIPasswordField.m
//  PasswordField
//
//  Created by 戚小建 on 15/12/9.
//  Copyright © 2015年 jianke. All rights reserved.
//

#import "UIPasswordField.h"

@implementation UIPasswordField


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor colorWithRed:0xdd/255. green:0xdd/255. blue:0xdd/255. alpha:1].CGColor;
        self.layer.borderWidth = 1;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextFieldTextDidChangeNotification object:nil];
        self.delegate = self;
        self.textColor = [UIColor clearColor];
        self.tintColor = [UIColor clearColor];
        self.keyboardType = UIKeyboardTypeNumberPad;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
 */

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //指定直线样式
    CGContextSetLineCap(context,
                        kCGLineCapSquare);
    //直线宽度
    CGContextSetLineWidth(context,
                          1.0);
    //设置颜色
    CGContextSetRGBStrokeColor(context,
                               0.867, 0.867, 0.867, 1.0);
    
    //开始绘制
    CGContextBeginPath(context);
    for(int i = 0; i<_length-1; i++)
    {
        CGRect bounds = self.bounds;
        CGFloat itemWidth = bounds.size.width/_length;
        
        CGContextMoveToPoint(context,
                             itemWidth*(i+1), 0);
        //下一点
        CGContextAddLineToPoint(context,
                                itemWidth*(i+1), bounds.size.height);
    }

    
    
    CGContextStrokePath(context);
}

#pragma mark -
- (void)textChanged:(NSNotification *)notification
{
    if (notification.object == self) {
        for (id item in self.subviews) {
            if ([item isKindOfClass:[UIImageView class]]) {
                [item removeFromSuperview];
            }
        }
        NSInteger num = self.text.length;
        for (int i = 0; i< num; i++) {
            CGRect bounds = self.bounds;
            CGFloat itemWidth = bounds.size.width/_length;
            
            UIImageView *dot = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
            dot.layer.cornerRadius = 5;
            dot.layer.masksToBounds = YES;
            dot.backgroundColor = [UIColor blackColor];
            CGPoint dotCenter = CGPointMake(itemWidth*(i+0.5), bounds.size.height/2);
            dot.center = dotCenter;
            [self addSubview:dot];
            
            
        }
        if (self.text.length >=_length){
            
            [self resignFirstResponder];
            if (_passwordDelegate && [_passwordDelegate respondsToSelector:@selector(didEnterPassword)]) {
                [_passwordDelegate didEnterPassword];
            }
        }
    }
}

#pragma mark - delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.text.length >=_length && string.length>0) {
        
        return NO;
    }
    
    
    return YES;
}



@end

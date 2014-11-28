//
//  ViewController.m
//  DrawApp
//
//  Created by Nick Bibikov on 11/20/14.
//  Copyright (c) 2014 Nick Bibikov. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    red = 59.0/255.0;
    green = 162.0/255.0;
    blue = 188.0/255.0;
    brush = 10.0;
    opacity = 1.0;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.drawImage.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.drawImage setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.drawImage.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) blendMode:kCGBlendModeNormal alpha:opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.drawImage.image = nil;
    UIGraphicsEndImageContext();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)colorPressed:(id)sender {
    
    UIButton * colorPressed = (UIButton*)sender;
    
    switch(colorPressed.tag)
    {
        case 0:
            red = 59.0/255.0;
            green = 162.0/255.0;
            blue = 188.0/255.0;
            brush = 10.0;
            break;
        case 1:
            red = 255.0/255.0;
            green = 89.0/255.0;
            blue = 90.0/255.0;
            brush = 10.0;
            break;
        case 2:
            red = 110.0/255.0;
            green = 228.0/255.0;
            blue = 115.0/255.0;
            brush = 10.0;
            break;
        case 3:
            red = 253.0/255.0;
            green = 199.0/255.0;
            blue = 83.0/255.0;
            brush = 10.0;
            break;
            
        case 4:
            red = 135.0/255.0;
            green = 77.0/255.0;
            blue = 146.0/255.0;
            brush = 10.0;
            break;
            
    }
}

- (IBAction)erasePressed:(id)sender {
    
    red = 255.0/255.0;
    green = 255.0/255.0;
    blue = 255.0/255.0;
    brush = 40.0;
    opacity = 1.0;
}

- (IBAction)moreButton:(id)sender {
}

- (IBAction)new:(id)sender {
    
    self.mainImage.image = nil;
    
}

@end

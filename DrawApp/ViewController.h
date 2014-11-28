//
//  ViewController.h
//  DrawApp
//
//  Created by Nick Bibikov on 11/20/14.
//  Copyright (c) 2014 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface ViewController : UIViewController {
    
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    CGPoint lastPoint;
    BOOL mouseSwiped;
    
    
}

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *drawImage;


- (IBAction)colorPressed:(id)sender;
- (IBAction)erasePressed:(id)sender;
- (IBAction)moreButton:(id)sender;

- (IBAction)new:(id)sender;

@end


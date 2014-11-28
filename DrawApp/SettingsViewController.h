//
//  SettingsViewController.h
//  DrawApp
//
//  Created by Nick Bibikov on 11/20/14.
//  Copyright (c) 2014 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerDelegate <NSObject>
@end


@interface SettingsViewController : UIViewController

@property CGFloat brush;
@property CGFloat opacity;


@property (weak, nonatomic) IBOutlet UISlider *opacityControl;
@property (weak, nonatomic) IBOutlet UISlider *brushControl;

@property (weak, nonatomic) IBOutlet UIImageView *opacityPreview;
@property (weak, nonatomic) IBOutlet UIImageView *brushPreview;

@property (weak, nonatomic) IBOutlet UILabel *opacityValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *brushValueLabel;
- (IBAction)sliderChanged:(id)sender;

@end

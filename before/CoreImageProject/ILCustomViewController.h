//
//  ILCustomViewController.h
//  CoreImageProject
//
//  Created by jeremy Templier on 15/04/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ILCustomViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *mImageView;

- (IBAction)applyFilterPressed:(id)sender;
@end

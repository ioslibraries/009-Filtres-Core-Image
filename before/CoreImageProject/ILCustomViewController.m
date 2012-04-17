//
//  ILCustomViewController.m
//  CoreImageProject
//
//  Created by jeremy Templier on 15/04/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import "ILCustomViewController.h"

@interface ILCustomViewController ()

@end

@implementation ILCustomViewController
@synthesize mImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* mImage=  [UIImage imageNamed:@"xp.png"];
    [self.mImageView setImage:mImage];
}

- (void)viewDidUnload
{
    [self setMImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)applyFilterPressed:(id)sender {
}
@end

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
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"xp" ofType:@"png"];
    NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
    
    sourceImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
    mContext = [CIContext contextWithOptions:nil];
    mFilter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey, sourceImage, @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
    
    [self logAllFilters];
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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CIImage *outputImage = [mFilter outputImage];
        NSLog(@"%@",[outputImage properties]);
        CGImageRef cgimg = [mContext createCGImage:outputImage fromRect:[outputImage extent]];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
            [self.mImageView setImage:newImg];
            
            CGImageRelease(cgimg);
        });
        
    });
      
}

-(void)logAllFilters {
    NSArray *properties = [CIFilter filterNamesInCategory:
                           kCICategoryBuiltIn];
    NSLog(@"%@", properties);
    for (NSString *filterName in properties) {
        CIFilter *fltr = [CIFilter filterWithName:filterName];
        NSLog(@"%@", [fltr attributes]);
    }
}


@end

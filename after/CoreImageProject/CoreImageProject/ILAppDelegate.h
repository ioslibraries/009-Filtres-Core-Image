//
//  ILAppDelegate.h
//  CoreImageProject
//
//  Created by jeremy Templier on 15/04/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILCustomViewController;
@interface ILAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ILCustomViewController* viewController;
@end

//
//  Squares_TekPubAppDelegate.h
//  Squares_TekPub
//
//  Created by Ben Hall on 11/01/11.
//  Copyright 2011 Ben Hall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Squares_TekPubViewController;

@interface Squares_TekPubAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Squares_TekPubViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Squares_TekPubViewController *viewController;

@end


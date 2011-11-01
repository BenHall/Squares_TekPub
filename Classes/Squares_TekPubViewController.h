//
//  Squares_TekPubViewController.h
//  Squares_TekPub
//
//  Created by Ben Hall on 11/01/11.
//  Copyright 2011 Ben Hall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Squares_TekPubViewController : UIViewController {
     NSMutableArray *squares;
}

-(IBAction)addTapped;
-(IBAction)randomizedTapped;
-(IBAction)removeTapped;

@end


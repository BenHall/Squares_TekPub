
//
//  Squares_TekPubViewController.m
//  Squares_TekPub
//
//  Created by Ben Hall on 11/01/11.
//  Copyright 2011 Ben Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "Squares_TekPubViewController.h"

@implementation Squares_TekPubViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:.3 green:.6 blue:.9 alpha:1.0];
    squares = [[NSMutableArray alloc] init];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [squares release];
    [super dealloc];
}

- (int)randomIntBetween:(int)min and:(int)max {
    return (random() % (max - min)) + min;
}

- (CGRect)randomRect {
    int x = [self randomIntBetween:0 and:240];
    int y = [self randomIntBetween:0 and:350];
    int w = [self randomIntBetween:20 and:60];
    int h = [self randomIntBetween:20 and:60];
    CGRect rect = CGRectMake(x, y, w, h);
    return rect;
}

- (UIColor *)randomColor {
    float r = [self randomIntBetween:0 and:255] / 255.0;
    float g = [self randomIntBetween:0 and:255] / 255.0;
    float b = [self randomIntBetween:0 and:255] / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:.8];
}

- (IBAction)addTapped {
    NSLog(@"Add Tapped");

    CGRect rect = [self randomRect];
    UIView *sq = [[UIView alloc] initWithFrame:rect];
    sq.backgroundColor = [self randomColor];

    [squares addObject:sq];
    [self.view addSubview:sq];
}

- (IBAction)randomizedTapped {
    NSLog(@"Randomised Tapped");
    [UIView beginAnimations:@"randomize" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    for(UIView *sq in squares){
        sq.frame = [self randomRect];
        sq.backgroundColor = [self randomColor];
    }

    [UIView commitAnimations];
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
   if ([animationID isEqualToString:@"removal"]){
       UIView *sq = (UIView *) context;
       [sq removeFromSuperview];
       [sq release];
   }

}

- (IBAction)removeTapped {
    NSLog(@"Remove Tapped");
    
    UIView *sq = [squares objectAtIndex:0];
    [squares removeObjectAtIndex:0];

    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector( animationDidStop:finished:context: )];
    [UIView beginAnimations:@"removal" context:sq];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];

    CGRect offScreenRect = sq.frame;
    offScreenRect.origin.y = 481;
    sq.frame =  offScreenRect;
    sq.alpha = .3;
    
    sq.transform = CGAffineTransformMakeRotation([self randomIntBetween:0 and:180]);
    
    [UIView commitAnimations];
}


@end

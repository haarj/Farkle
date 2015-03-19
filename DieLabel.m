//
//  DieLabel.m
//  Farkle
//
//  Created by Justin Haar on 3/19/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

-(IBAction)onTapped:(UITapGestureRecognizer *)sender
{
    [self roll];
    NSLog(@"number");
}


-(void)roll
{
//    self.number = (arc4random()%6)+1; 
//    NSString *string = [NSString stringWithFormat:@"%i", self.number];
//    self.label.text = string;
//    NSLog(@"%i", self.number);
    
}

@end

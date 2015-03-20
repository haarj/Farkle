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
    [self.delegate dieLabelDelegateMethod:sender];

}

-(void)roll
{
    int i = (arc4random()%6)+1;
    self.text = [NSString stringWithFormat:@"%d", i];
}


@end

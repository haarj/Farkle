//
//  ViewController.m
//  Farkle
//
//  Created by Justin Haar on 3/19/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>

@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *dieLabels;
@property (nonatomic) NSMutableArray *dice;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSLog(@"%d", self.dieLabels.count);
//
//    for (DieLabel *a in self.dieLabels) {
//        int i = (arc4random()%6)+1;
//        a.text = [NSString stringWithFormat:@"%d", i];
//        NSLog(@"%@", a.text);
//    }

    for (DieLabel *label in self.dieLabels) {
        label.delegate = self;
    }

    self.dice = [NSMutableArray new];

}
- (IBAction)onRollButtonPressed:(DieLabel *)sender {

    for (DieLabel *label in self.dieLabels) {
        if (![self.dice containsObject:label]) {
            [label roll];
        }
    }
    NSLog(@"Dice %@", self.dice);
}

#pragma mark - DieLabelDelegate protocols

-(void)dieLabelDelegateMethod:(UITapGestureRecognizer *)sender
{
    //one label is tapped toggle locked on lock
    DieLabel *label = (DieLabel *) sender.view;


    if([self.dice containsObject:label]){
        [self.dice removeObject:label];
        label.backgroundColor = [UIColor greenColor];
    } else{
        [self.dice addObject:label];
         label.backgroundColor = [UIColor yellowColor];
    }

     //toggle the lock status
    label.isLocked = !label.isLocked;



    NSLog(@"dice count %ld",self.dice.count);

}
@end

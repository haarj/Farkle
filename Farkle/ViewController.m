//
//  ViewController.m
//  Farkle
//
//  Created by Justin Haar on 3/19/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *dieLabels;

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



}
- (IBAction)onRollButtonPressed:(DieLabel *)sender {

    for (DieLabel *label in self.dieLabels) {
        [label roll];
    }


}

@end

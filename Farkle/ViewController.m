//
//  ViewController.m
//  Farkle
//
//  Created by Justin Haar on 3/19/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate, UIDynamicAnimatorDelegate, UIGestureRecognizerDelegate, UICollisionBehaviorDelegate>

@property (nonatomic) NSMutableArray *dieLabels;
@property (nonatomic) NSMutableArray *selectedDice;

@property (weak, nonatomic) IBOutlet DieLabel *dieOne;
@property (weak, nonatomic) IBOutlet DieLabel *dieTwo;

@property (weak, nonatomic) IBOutlet DieLabel *dieThree;
@property (weak, nonatomic) IBOutlet DieLabel *dieFour;
@property (weak, nonatomic) IBOutlet DieLabel *dieFive;
@property (weak, nonatomic) IBOutlet DieLabel *dieSix;
@property (weak, nonatomic) IBOutlet UILabel *userOneScore;
@property (weak, nonatomic) IBOutlet UILabel *userTwoScore;
@property (weak, nonatomic) IBOutlet UIButton *nextPlayerOnTapped;
@property (nonatomic) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic) UIDynamicItemBehavior *dynamicItemBehavior;
@property (nonatomic) UIGravityBehavior *gravity;
@property (nonatomic) UICollisionBehavior *collision;
@property (weak, nonatomic) IBOutlet UIView *subView;

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated
{
    [self.view addSubview:self.subView];
    [self.view sendSubviewToBack:self.subView];
    [super viewDidAppear:animated];

    for (DieLabel *label in self.dieLabels)
    {
        label.delegate = self;
    }

    self.selectedDice = [NSMutableArray new];

    self.dieLabels = [NSMutableArray arrayWithObjects:self.dieOne, self.dieTwo, self.dieThree, self.dieFour, self.dieFive, self.dieSix, nil];

    //Initialie the animator
    //Having a problem with the collion and how it relates to the reference view

    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.subView];

    //Add Dynamic Animator Item
    self.dynamicItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:self.dieLabels];
    self.dynamicItemBehavior.elasticity = 1.0;
    self.dynamicItemBehavior.friction = 0.0;

    //Add gravity
    self.gravity = [[UIGravityBehavior alloc]initWithItems:self.dieLabels];

    CGVector direction = CGVectorMake(0.2, 1.0);
    //(0.06, 0.95);
    self.gravity.gravityDirection = direction;

    //Add Collion
    self.collision = [[UICollisionBehavior alloc]initWithItems:self.dieLabels];
    [self.collision setTranslatesReferenceBoundsIntoBoundary:YES];
    [self.collision  setCollisionMode:UICollisionBehaviorModeEverything];
    self.collision.translatesReferenceBoundsIntoBoundary = TRUE;

    [self.dynamicAnimator addBehavior:self.dynamicItemBehavior];
    [self.dynamicAnimator addBehavior:self.gravity];
    [self.dynamicAnimator addBehavior:self.collision];


}

- (IBAction)onRollButtonPressed:(DieLabel *)sender
{

    for (DieLabel *label in self.dieLabels)
    {
        if (![self.selectedDice containsObject:label])
        {
            [label roll];
        }
    }
    //if all locked...clear dice array and roll ALL
    if(self.dieLabels.count == self.selectedDice.count)
    {
        //all locked....reset
        for (DieLabel *label in self.selectedDice)
        {
            [label roll];
            label.backgroundColor = [UIColor greenColor];
        }

        [self.selectedDice removeAllObjects];
        self.selectedDice = [NSMutableArray new];
    }
}

#pragma mark - DieLabelDelegate protocols

-(void)dieLabelDelegateMethod:(UITapGestureRecognizer *)sender
{
    //one label is tapped toggle locked on lock
    DieLabel *label = (DieLabel *) sender.view;


    if([self.selectedDice containsObject:label])
    {
        [self.selectedDice removeObject:label];
        label.backgroundColor = [UIColor greenColor];
    } else
    {
        [self.selectedDice addObject:label];
         label.backgroundColor = [UIColor yellowColor];
    }

     //toggle the lock status ???????
    label.isLocked = !label.isLocked;
}


//the view controller becomes the initiater
-(BOOL)canBecomeFirstResponder
{
    return YES;
}


//-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
//{
//    self.view motionEnded:<#(UIEventSubtype)#> withEvent:<#(UIEvent *)#>
//}


@end

//
//  DieLabel.h
//  Farkle
//
//  Created by Justin Haar on 3/19/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject>
@required
-(void) dieLabelMethod:(NSString *)text;


@end

@interface DieLabel : UILabel

-(void)roll;

@property id<DieLabelDelegate> delegate;

@end

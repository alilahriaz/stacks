//
//  GameViewController.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-16.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, assign) NSInteger tapsDetected;

@end

@implementation GameViewController
@dynamic view;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)tapDetected:(id)sender {
    if (self.tapsDetected == 0) {
        [self.view startGame];
    }
    else {
        [self.view evaluateScrollPosition];
        [self.view startGame];
    }
    self.tapsDetected ++;
}

//resize target on successive tap

//label for score count

//you lose label, end game state

//restart game button and state

@end

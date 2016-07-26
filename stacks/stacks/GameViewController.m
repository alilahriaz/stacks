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
@property (nonatomic, assign) NSInteger score;

@end

@implementation GameViewController
@dynamic view;


- (IBAction)tapDetected:(id)sender {
    if (self.tapsDetected == 0) {
        [self.view startGame];
        self.score = 0;
    }
    else {
        BOOL scored = [self.view evaluateScrollPosition];
        if (scored) {
            self.score++;
        }
        [self.view restartScroll];
    }
    self.tapsDetected ++;
}

- (void)setScore:(NSInteger)score {
    _score = score;
    [self.view updateScore:score];
}

//resize target on multiples of 5 tap

//alter speed at multiples of 3

//you lose label, end game state

//restart game button and state

//pause game state

@end

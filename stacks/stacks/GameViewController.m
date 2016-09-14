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
@property (nonatomic, assign) NSInteger highScore;

@end

@implementation GameViewController
@dynamic view;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.highScore = 0; //pull from userDef
}

- (void)setHighScore:(NSInteger)highScore {
    _highScore = highScore;
    [self.view updateHighScore:highScore];
}

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
        else {
            [self checkIfNewHighScore];
            self.score = 0;
        }
        [self.view restartScroll];
    }
    self.tapsDetected ++;
}

- (void)setScore:(NSInteger)score {
    _score = score;
    [self.view updateScore:score];
}

- (void)checkIfNewHighScore {
    if (self.score > self.highScore) {
        [self setHighScore:self.score];
    }
}

//resize target on multiples of 5 tap

//alter speed at multiples of 3

//you lose label, end game state

//restart game button and state

//pause game state

//store high scores in nsuserdefaults

@end

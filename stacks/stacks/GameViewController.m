//
//  GameViewController.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-16.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "GameViewController.h"
#import "Constants.h"
#import "GameManager.h"

@interface GameViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, assign) NSInteger tapsDetected;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger highScore;

@end

@implementation GameViewController
@dynamic view;


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.highScore = [GameManager sharedInstance].highScore;
}

#pragma mark - Logic

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

- (void)checkIfNewHighScore {
    if (self.score > self.highScore) {
        [self setHighScore:self.score];
    }
}

#pragma mark - Setters

- (void)setScore:(NSInteger)score {
    _score = score;
    [GameManager sharedInstance].currentScore = score;
    [self.view updateScore:score];
}

- (void)setHighScore:(NSInteger)highScore {
    _highScore = highScore;
    [GameManager sharedInstance].highScore = highScore;
    [self.view updateHighScore:highScore];
}


//Operation
//you lose label, end game state
@end

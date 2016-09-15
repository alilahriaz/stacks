//
//  GameManager.m
//  stacks
//
//  Created by Ali Riaz on 2016-09-15.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "GameManager.h"
#import "Constants.h"

@implementation GameManager

#pragma mark - Singleton

+ (GameManager *)sharedInstance {
    static GameManager *sharedGameManager = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        sharedGameManager = [[self alloc] init];
    });
    return sharedGameManager;
}

#pragma mark - Methods

- (id)init {
    if (self = [super init]) {
        self.currentScore = 0;
        self.highScore = [self getPreviousHighScore];
    }
    return self;
}

#pragma mark - Setters

- (void)setCurrentScore:(NSInteger)currentScore {
    _currentScore = currentScore;
    
    if (currentScore > self.highScore) {
        self.highScore = currentScore;
    }
}

- (void)setHighScore:(NSInteger)highScore {
    _highScore = highScore;
    [self storeHighScore:highScore];
}

#pragma mark - UserDefaults

- (void)storeHighScore:(NSInteger)score {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:score forKey:HighScoreIdentifier];
    [userDefaults synchronize];
}

- (NSInteger)getPreviousHighScore {
    return [[NSUserDefaults standardUserDefaults] integerForKey:HighScoreIdentifier];
}

@end

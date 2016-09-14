//
//  GameView.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-16.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "GameView.h"
#import "TargetFrameView.h"

NSString *scrollAnimationKey = @"transform.translation.x";
CGFloat targetViewCornerRaduis = 4.0f;
CGFloat defaultScrollingSpeed = 3.0f;
CGFloat scrollingAnimationDurationModifier = 0.80f;
CGFloat scrollingViewDefaultPosition = -80.0f;


@interface GameView()

@property (weak, nonatomic) IBOutlet TargetFrameView *targetView;
@property (weak, nonatomic) IBOutlet UILabel *tapToBeginLabel;
@property (weak, nonatomic) IBOutlet FrameBaseView *scrollingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollingViewLeading;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic , assign) CGFloat scrollingSpeed;
@property (weak, nonatomic) IBOutlet UILabel *highscoreLabel;

@end

@implementation GameView

#pragma mark - NSObject

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.tapToBeginLabel.hidden = NO;
    
    self.targetView.layer.cornerRadius = targetViewCornerRaduis;
    [self hideScoreLabel];
}

#pragma mark - Game animations

- (void)restartScroll {
    [self startARound];
}

- (void)startGame {
    self.tapToBeginLabel.hidden = YES;
    self.scoreLabel.hidden = NO;
    self.scrollingSpeed = defaultScrollingSpeed;
    [self startARound];
}

- (void)startARound {
    CABasicAnimation *scrollAnimation = [CABasicAnimation animationWithKeyPath:scrollAnimationKey];
    [scrollAnimation setFromValue:[NSNumber numberWithFloat:scrollingViewDefaultPosition]];
    [scrollAnimation setToValue:[NSNumber numberWithFloat:self.frame.size.width]];
    [scrollAnimation setDuration:self.scrollingSpeed];
    
    [self.scrollingView.layer addAnimation:scrollAnimation forKey:scrollAnimationKey];
    
    self.scrollingView.transform = CGAffineTransformMakeTranslation(self.frame.size.width, 0.0f);
}

- (BOOL)evaluateScrollPosition {
    BOOL result = NO;
    [self.scrollingView.layer removeAnimationForKey:scrollAnimationKey];
    
    CGRect scrollingFrame = [self.scrollingView.layer.presentationLayer frame];
    CGRect target = self.targetView.frame;
    
    NSLog(@"x1: %f, X1: %f", scrollingFrame.origin.x, target.origin.x);
    NSLog(@"x2: %f, X2: %f", scrollingFrame.origin.x + scrollingFrame.size.width, target.origin.x + target.size.width);
    
    if ([self ifObject:scrollingFrame withinTargetBounds:target]) {
        result = YES;
        [self upGameSpeed];
    }
    else {
        [self restartGame];
        result = NO;
    }
    
    self.scrollingView.transform = CGAffineTransformMakeTranslation(scrollingViewDefaultPosition, 0.0f);
    return result;
}

- (void)upGameSpeed {
    NSLog(@"Scored!");
    [self.scrollingView transformFrame];
    [self.targetView transformFrame];
    self.scrollingSpeed *= scrollingAnimationDurationModifier;
}

- (void)restartGame {
    NSLog(@"Restart :(");
    [self.targetView backToOriginalFrame];
    self.scrollingSpeed = defaultScrollingSpeed;
}

#pragma mark - Score Labels

- (void)updateScore:(NSInteger)score {
    self.scoreLabel.text = [NSString stringWithFormat:@"%li", score];
}

- (void)updateHighScore:(NSInteger)highscore {
    self.highscoreLabel.text = [NSString stringWithFormat:@"%li", highscore];
}

- (void)hideScoreLabel {
    self.scoreLabel.text = 0;
}

#pragma mark - Helpers

- (BOOL)ifObject:(CGRect)scrollingFrame withinTargetBounds:(CGRect)target {
    return (scrollingFrame.origin.x >= target.origin.x && (scrollingFrame.origin.x + scrollingFrame.size.width) <= (target.origin.x + target.size.width));
}

@end

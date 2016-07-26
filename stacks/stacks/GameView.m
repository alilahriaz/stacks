//
//  GameView.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-16.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "GameView.h"

NSString *scrollAnimationKey = @"transform.translation.x";

@interface GameView()

@property (weak, nonatomic) IBOutlet UIView *targetView;
@property (weak, nonatomic) IBOutlet UILabel *tapToBeginLabel;
@property (weak, nonatomic) IBOutlet UIView *scrollingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollingViewLeading;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation GameView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.tapToBeginLabel.hidden = NO;
    
    self.targetView.layer.cornerRadius = 4.0f;
    [self hideScoreLabel];
}

- (void)hideScoreLabel {
    self.scoreLabel.text = 0;
    self.scoreLabel.hidden = YES;
}

- (void)restartScroll {
    [self startARound];
}

- (void)startGame {
    self.tapToBeginLabel.hidden = YES;
    self.scoreLabel.hidden = NO;
    [self startARound];
}

- (void)startARound {
    CABasicAnimation *scrollAnimation = [CABasicAnimation animationWithKeyPath:scrollAnimationKey];
    [scrollAnimation setFromValue:[NSNumber numberWithFloat:-80.f]];
    [scrollAnimation setToValue:[NSNumber numberWithFloat:self.frame.size.width]];
    [scrollAnimation setDuration:3.0f];
    
    [self.scrollingView.layer addAnimation:scrollAnimation forKey:scrollAnimationKey];
    
    self.scrollingView.transform = CGAffineTransformMakeTranslation(self.frame.size.width, 0.0f);
}

- (BOOL)evaluateScrollPosition {
    BOOL result = NO;
    [self.scrollingView.layer removeAnimationForKey:scrollAnimationKey];
    
    CGRect scrollingFrame = [self.scrollingView.layer.presentationLayer frame];
    CGRect target = self.targetView.frame;
    
    NSLog(@"Frame X: %f", scrollingFrame.origin.x);
    if ([self ifObject:scrollingFrame withinTargetBounds:target]) {
        result = YES;
        NSLog(@"Scored!");
    }
    else {
        result = NO;
    }
    self.scrollingView.transform = CGAffineTransformMakeTranslation(-80.f, 0.0f);
    return result;
}

- (void)updateScore:(NSInteger)score {
    self.scoreLabel.text = [NSString stringWithFormat:@"%li", score];
}

- (BOOL)ifObject:(CGRect)scrollingFrame withinTargetBounds:(CGRect)target {
    return (scrollingFrame.origin.x >= target.origin.x && (scrollingFrame.origin.x + scrollingFrame.size.width) <= (target.origin.x + target.size.width));
}

@end

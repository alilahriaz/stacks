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

@end

@implementation GameView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.tapToBeginLabel.hidden = NO;
    
    self.targetView.layer.cornerRadius = 4.0f;
}

- (void)hideGameLabel{
    self.tapToBeginLabel.hidden = YES;
}

- (void)startGame {
    self.tapToBeginLabel.hidden = YES;
    
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

- (void)evaluateScrollPosition {
    [self.scrollingView.layer removeAnimationForKey:scrollAnimationKey];
    
    CGRect scrollingFrame = [self.scrollingView.layer.presentationLayer frame];
    CGRect target = self.targetView.frame;
    
    NSLog(@"Frame X: %f", scrollingFrame.origin.x);
    if (scrollingFrame.origin.x >= target.origin.x) {
        NSLog(@"Scored!");
    }
    self.scrollingView.transform = CGAffineTransformMakeTranslation(-80.f, 0.0f);
}

@end

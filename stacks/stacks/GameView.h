//
//  GameView.h
//  stacks
//
//  Created by Ali Riaz on 2016-07-16.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameView : UIView

- (void)startGame;
- (BOOL)evaluateScrollPosition;
- (void)restartScroll;
- (void)updateScore:(NSInteger)score;

@end

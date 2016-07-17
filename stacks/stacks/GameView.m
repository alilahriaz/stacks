//
//  GameView.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-16.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "GameView.h"

@interface GameView()

@property (weak, nonatomic) IBOutlet UIView *targetView;
@property (weak, nonatomic) IBOutlet UILabel *tapToBeginLabel;
@property (weak, nonatomic) IBOutlet UIView *scrollingView;

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

@end

//
//  TargetFrameView.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-25.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#define ScoreModifierFactor 3

#import "TargetFrameView.h"
#import "GameManager.h"

@implementation TargetFrameView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

- (void)setScore:(NSInteger)score {
    if ((score != 0) && (score % ScoreModifierFactor) == 0) {
        [self transformFrame];
    }
}

@end

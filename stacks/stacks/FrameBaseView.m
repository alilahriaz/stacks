//
//  FrameBaseView.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-25.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "FrameBaseView.h"

CGFloat resetFrameModifier = 0.95f;
CGFloat frameModifier = 0.80f;

@interface FrameBaseView ()

@property (nonatomic, assign) CGRect originalFrame;
@property (nonatomic, assign) CGFloat modifier;

@end

@implementation FrameBaseView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.modifier = resetFrameModifier;
    self.originalFrame = self.frame;
}

- (void)backToOriginalFrame {
    self.modifier = resetFrameModifier;
    self.transform = CGAffineTransformIdentity;
}

- (void)transformFrame {
    //should transform scrolling and target views, except when game is over
    self.modifier *= resetFrameModifier;
    self.transform = CGAffineTransformMakeScale(self.modifier, self.modifier);
}


@end

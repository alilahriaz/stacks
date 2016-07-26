//
//  FrameBaseView.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-25.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "FrameBaseView.h"

@interface FrameBaseView ()

@property (nonatomic, assign) CGRect originalFrame;
@property (nonatomic, assign) CGFloat modifier;

@end

@implementation FrameBaseView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.modifier = 0.95f;
    self.originalFrame = self.frame;
}

- (void)backToOriginalFrame {
    self.transform = CGAffineTransformIdentity;
}

- (void)transformFrame {
    self.modifier *= 0.8;
    self.transform = CGAffineTransformMakeScale(self.modifier, self.modifier);
}


@end

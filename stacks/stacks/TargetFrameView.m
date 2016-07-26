//
//  TargetFrameView.m
//  stacks
//
//  Created by Ali Riaz on 2016-07-25.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import "TargetFrameView.h"

@implementation TargetFrameView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 5.0f;
}

@end

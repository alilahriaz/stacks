//
//  FrameBaseView.h
//  stacks
//
//  Created by Ali Riaz on 2016-07-25.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrameBaseView : UIView

@property (nonatomic, assign) NSInteger score;

- (void)backToOriginalFrame;
- (void)transformFrame;

@end

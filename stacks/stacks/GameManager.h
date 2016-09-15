//
//  GameManager.h
//  stacks
//
//  Created by Ali Riaz on 2016-09-15.
//  Copyright © 2016 Ali Riaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject

@property (nonatomic, assign) NSInteger currentScore;
@property (nonatomic, assign) NSInteger highScore;

+ (GameManager *)sharedInstance;
- (void)storeHighScore:(NSInteger)score;

@end

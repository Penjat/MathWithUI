//
//  GameManager.h
//  2PlayerMath
//
//  Created by Spencer Symington on 2019-01-14.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameManager : NSObject

@property NSInteger curAnswer;
@property NSInteger player1Lives;
@property NSInteger player2Lives;
@property BOOL isPlayer1;

-(instancetype)init;
-(NSInteger)addToAnswer:(NSInteger)nextDigit;
-(BOOL)submitAnswer;
-(NSString*)getRandomQuestion;
-(BOOL)checkPlayer1Gameover;
-(BOOL)checkPlayer2Gameover;
-(void)reset;
@end

NS_ASSUME_NONNULL_END

//
//  GameManager.m
//  2PlayerMath
//
//  Created by Spencer Symington on 2019-01-14.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "GameManager.h"

@interface GameManager(){
    Player *_player1;
    Player *_player2;
    NSInteger _correctAnswer;
    
    
}

@end

@implementation GameManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _player1 = [[Player alloc]init];
        _player2 = [[Player alloc]init];
        _player1Lives = 3;
        _player2Lives = 3;
    }
    return self;
}
-(NSInteger)addToAnswer:(NSInteger)nextDigit{
    
    self.curAnswer *=10;
    self.curAnswer += nextDigit;
    
    return self.curAnswer;
}
-(void)submitAnswer{
    NSLog(@"current answer is %li",self.curAnswer);
    if(self.curAnswer == _correctAnswer){
        NSLog(@"correct" );
        
        
    }else{
        NSLog(@"incorrect" );
    }
    _curAnswer = 0;
    
}
-(NSString*)getRandomQuestion{
    NSInteger firstNumber = arc4random_uniform(20)+1;
    NSInteger secondNumber = arc4random_uniform(20)+1;
    correctAnswer = firstNumber + secondNumber;
    
    return [NSString stringWithFormat:@"Player 1: %li + %li",firstNumber,secondNumber ];
}
@end

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
        _isPlayer1= YES;
    }
    return self;
}
-(NSInteger)addToAnswer:(NSInteger)nextDigit{
    
    self.curAnswer *=10;
    self.curAnswer += nextDigit;
    
    return self.curAnswer;
}

-(BOOL)submitAnswer{
    //TODO return YES if should update score
    NSLog(@"current answer is %li",self.curAnswer);
    if(self.curAnswer == _correctAnswer){
        NSLog(@"correct" );
        
        
    }else{
        NSLog(@"incorrect" );
        [self loseLife ];
        self.isPlayer1 = !self.isPlayer1;
        _curAnswer = 0;
        return YES;
    }
    self.isPlayer1 = !self.isPlayer1;
    _curAnswer = 0;
    return NO;
}
-(NSString*)getRandomQuestion{
    NSUInteger questionType = arc4random_uniform(4);
    NSInteger firstNumber = arc4random_uniform(20)+1;
    NSInteger secondNumber = arc4random_uniform(20)+1;
    
    switch(questionType){
        case 0:
            _correctAnswer = firstNumber + secondNumber;
            return [NSString stringWithFormat:@"%li + %li",firstNumber,secondNumber ];
        case 1:
            _correctAnswer = firstNumber - secondNumber;
            return [NSString stringWithFormat:@"%li - %li",firstNumber,secondNumber ];
        case 2:
            _correctAnswer = firstNumber * secondNumber;
            return [NSString stringWithFormat:@"%li * %li",firstNumber,secondNumber ];
        case 3:
            _correctAnswer = firstNumber / secondNumber;
            return [NSString stringWithFormat:@"%li / %li",firstNumber,secondNumber ];
        default:
            _correctAnswer = firstNumber + secondNumber;
            
            return [NSString stringWithFormat:@"%li + %li",firstNumber,secondNumber ];
    }
    
}
-(void)loseLife{
    if(self.isPlayer1){
        self.player1Lives--;
        
        return;
    }
    self.player2Lives--;
    
}
-(BOOL)checkPlayer1Gameover{
    if(_player1Lives <= 0){
        return YES;
    }
    return NO;
}
-(BOOL)checkPlayer2Gameover{
    if(_player2Lives <= 0){
        return YES;
    }
    return NO;
}
-(void)reset{
    
    _player1Lives = 3;
    _player2Lives = 3;
    _isPlayer1= YES;
}
@end

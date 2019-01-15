//
//  ViewController.m
//  2PlayerMath
//
//  Created by Spencer Symington on 2019-01-14.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ViewController.h"
#import "GameManager.h"

@interface ViewController ()

@property (strong, nonatomic) GameManager *gameManager;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _gameManager = [[GameManager alloc]init];
    [self getRandomQuestion];
    self.playerAnswer.text = @"";
    [self updateScores ];
    [self showCurPlayer];
    self.playerFeedback.text = @"";
}
- (IBAction)pressedPlayAgain:(id)sender {
    self.gameOverView.hidden = YES;
    [self.gameManager reset];
    [self getRandomQuestion];
    self.playerAnswer.text = @"";
    [self updateScores ];
    [self showCurPlayer];
    self.playerFeedback.text = @"";
    
}


- (IBAction)pressNumber:(UIButton*)sender {
    NSLog(@"%li",sender.tag);
    _playerAnswer.text = [NSString stringWithFormat:@"%li", [self.gameManager addToAnswer:sender.tag] ];
    
}
- (IBAction)subimtAnswer:(id)sender {
    
    if([self.gameManager submitAnswer]){
        [self updateScores];
        [self animateFeedbackWasCorrect:NO];
        if([self.gameManager checkPlayer1Gameover]){
            self.gameOverView.hidden = false;
            
            [self.gameOverView setAlpha:0.0f];
            //fade in
            [UIView animateWithDuration:2.0f animations:^{
                
                [self.gameOverView setAlpha:1.0f];
                
            }];
            return;
        }
        if([self.gameManager checkPlayer2Gameover]){
            self.gameOverView.hidden = false;
            return;
        }
        
    }else{
        [self animateFeedbackWasCorrect:YES];
    }
    [self showCurPlayer];
    [self getRandomQuestion];
    self.playerAnswer.text = @"";
}
-(void)animateFeedbackWasCorrect:(BOOL)wasCorrect{
    
    if(wasCorrect){
        self.playerFeedback.text = @"correct";
        self.playerFeedback.textColor = UIColor.greenColor;
    }else{
        self.playerFeedback.text = @"wrong";
        self.playerFeedback.textColor = UIColor.redColor;
    }
    
    
    [self.playerFeedback setAlpha:1.0f];
    CGPoint startPoint = CGPointMake(_playerAnswer.center.x ,_playerAnswer.center.y);
    self.playerFeedback.center = startPoint;
    //self.playerFeedback.center = CGPointMake(x,y);
    [UIView animateWithDuration:1.2f animations:^{
        
        [self.playerFeedback setAlpha:0.0f];
        CGPoint endPoint = CGPointMake(self.playerAnswer.center.x,self.playerAnswer.center.y-50);
        self.playerFeedback.center = endPoint;
        
    }];
}
-(void)showCurPlayer{
    if([self.gameManager isPlayer1]){
        self.curPlayer.text = @"Player 1";
        self.curPlayer.textColor = UIColor.redColor;
        return;
    }
    self.curPlayer.text = @"Player 2";
    self.curPlayer.textColor = UIColor.blueColor;
}
-(void)updateScores{
    
    NSLog(@"player 1 score is %li",_gameManager.player1Lives);
    NSString *lives = @"";
    for(int i=0;i<_gameManager.player1Lives;i++){
        
        lives = [lives stringByAppendingString:@"♥︎"];
    }
    _player1score.text = lives;
    lives = @"";
    for(int i=0;i<_gameManager.player2Lives;i++){
        lives = [lives stringByAppendingString:@"♥︎"];
    }
    _player2score.text = lives;
    
    
}


-(void)getRandomQuestion{
    self.question.text = [self.gameManager getRandomQuestion];
}


@end

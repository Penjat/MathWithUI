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
}
- (IBAction)pressedPlayAgain:(id)sender {
    self.gameOverView.hidden = YES;
    [self.gameManager reset];
    [self getRandomQuestion];
    self.playerAnswer.text = @"";
    [self updateScores ];
    [self showCurPlayer];
    
}


- (IBAction)pressNumber:(UIButton*)sender {
    NSLog(@"%li",sender.tag);
    _playerAnswer.text = [NSString stringWithFormat:@"%li", [self.gameManager addToAnswer:sender.tag] ];
    
}
- (IBAction)subimtAnswer:(id)sender {
    if([self.gameManager submitAnswer]){
        [self updateScores];
        if([self.gameManager checkPlayer1Gameover]){
            self.gameOverView.hidden = false;
            return;
        }
        if([self.gameManager checkPlayer2Gameover]){
            self.gameOverView.hidden = false;
            return;
        }
        
    }
    [self showCurPlayer];
    [self getRandomQuestion];
    self.playerAnswer.text = @"";
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
    _player1score.text = [NSString stringWithFormat:@"player 1 lives: %li",_gameManager.player1Lives ];
    _player2score.text = [NSString stringWithFormat:@"player 2 lives: %li",_gameManager.player2Lives ];
    
}


-(void)getRandomQuestion{
    self.question.text = [self.gameManager getRandomQuestion];
}


@end

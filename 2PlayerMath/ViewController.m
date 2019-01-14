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
    self.playerAnswer.text = @"0";
}


- (IBAction)pressNumber:(UIButton*)sender {
    NSLog(@"%li",sender.tag);
    _playerAnswer.text = [NSString stringWithFormat:@"%li", [self.gameManager addToAnswer:sender.tag] ];
    
}
- (IBAction)subimtAnswer:(id)sender {
    [self.gameManager submitAnswer];
    [self getRandomQuestion];
    self.playerAnswer.text = @"0";
}



-(void)getRandomQuestion{
    self.question.text = [self.gameManager getRandomQuestion];
}


@end

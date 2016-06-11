//
//  LRMViewController.h
//  Pirate Assigment
//
//  Created by Lucas Maciel on 6/18/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRMFactory.h"
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface LRMViewController : UIViewController <AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer1;
}


@property (strong, nonatomic) IBOutlet UIView *charView;

@property (strong, nonatomic) IBOutlet UIView *actionView;

@property (strong, nonatomic) IBOutlet UIView *storyView;

@property (strong, nonatomic) IBOutlet UIView *mapView;

@property (strong, nonatomic) IBOutlet UIImageView *imagemDeFundo;

@property (strong, nonatomic) IBOutlet UILabel *healthLabel;

@property (strong, nonatomic) IBOutlet UILabel *damageLabel;

@property (strong, nonatomic) IBOutlet UILabel *weaponNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *armorNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

@property (strong, nonatomic) LRMFactory *currentFactory;

@property (nonatomic) CGPoint mapCoordinates;

@property (strong, nonatomic) IBOutlet UIButton *actionButtonOut;

@property (strong, nonatomic) IBOutlet UIButton *northButton;

@property (strong, nonatomic) IBOutlet UIButton *southButton;

@property (strong, nonatomic) IBOutlet UIButton *westButton;

@property (strong, nonatomic) IBOutlet UIButton *eastButton;

@property (nonatomic) NSMutableArray *actionDoneAtTile;

@property (nonatomic) int bossLife;

@property (nonatomic) int bossDamage;

@property (strong, nonatomic) MPMoviePlayerViewController *moviePlayer;

- (IBAction)playMovie:(id)sender;

- (IBAction)northButtonPressed:(UIButton *)sender;

- (IBAction)southButtonPressed:(UIButton *)sender;

- (IBAction)westButtonPressed:(UIButton *)sender;


- (IBAction)eastButtonPressed:(UIButton *)sender;


- (IBAction)resetButtonPressed:(UIButton *)sender;

- (IBAction)actionButtonPressed:(UIButton *)sender;

-(void)updateCurrentTile;


-(void)updateButtonsVisibility;

-(void)startGame;


@end

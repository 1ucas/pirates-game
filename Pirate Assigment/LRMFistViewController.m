//
//  LRMFistViewController.m
//  Pirate Assigment
//
//  Created by Lucas Maciel on 7/8/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import "LRMFistViewController.h"

@interface LRMFistViewController ()

@end

@implementation LRMFistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *music = [[NSBundle mainBundle] pathForResource:@"whisper" ofType:@"mp3"];
    
    audioPlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    audioPlayer1.delegate = self;
    audioPlayer1.numberOfLoops = -1;
    [audioPlayer1 play];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startGameButtonPressed:(UIButton *)sender
{
    [audioPlayer1 stop];
    [self performSegueWithIdentifier:@"toGameViewController" sender:sender];
}

- (IBAction)intructionButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"toControlViewController" sender:sender];
}

@end

//
//  LRMFistViewController.h
//  Pirate Assigment
//
//  Created by Lucas Maciel on 7/8/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface LRMFistViewController : UIViewController <AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer1;
}

- (IBAction)startGameButtonPressed:(UIButton *)sender;
- (IBAction)intructionButtonPressed:(UIButton *)sender;


@end

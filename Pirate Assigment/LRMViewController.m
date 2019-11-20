//
//  LRMViewController.m
//  Pirate Assigment
//
//  Created by Lucas Maciel on 6/18/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import "LRMViewController.h"
#import "LRMFactory.h"
#import "LRMTile.h"

#define defBossLife 50
#define defBossDamage 5

@interface LRMViewController ()

@end

@implementation LRMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *music = [[NSBundle mainBundle] pathForResource:@"light" ofType:@"mp3"];
    
    audioPlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    audioPlayer1.delegate = self;
    audioPlayer1.numberOfLoops = -1;
    
    [self startGame];
}

-(void)startGame
{
    [audioPlayer1 play];
    self.charView.alpha = 0.8;
    self.actionView.alpha = 0.8;
    self.storyView.alpha = 0.8;
    self.mapView.alpha = 0.8;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", 10];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", 1];
    self.weaponNameLabel.text = @"Wood Sword";
    self.armorNameLabel.text = @"Socks";
    self.currentFactory = [[LRMFactory alloc] init];
    NSArray *tilesArray = [self.currentFactory tiles];
    LRMTile *Tile1 = [[tilesArray objectAtIndex:0] objectAtIndex:0];
    self.storyLabel.text = Tile1.story;
    [self.actionButtonOut setTitle:Tile1.actionButtonName forState:UIControlStateNormal];
    self.mapCoordinates = CGPointMake(0, 0);
    [self updateButtonsVisibility];
    [self actionDoneAtTile][0] = NO;
    self.actionDoneAtTile = [NSMutableArray array];
    for (int n = 1; n <= 12; n++) [self.actionDoneAtTile addObject:@"NO"];
    self.actionButtonOut.hidden = NO;
    self.imagemDeFundo.image = Tile1.backgroundImage;
    self.bossLife = defBossLife;
    self.bossDamage = defBossDamage;
}



-(void)updateCurrentTile
{
    [self updateButtonsVisibility];
    NSArray *titlesArray = [self.currentFactory tiles];
    LRMTile *currentTile = [[titlesArray objectAtIndex:self.mapCoordinates.x]objectAtIndex:self.mapCoordinates.y];
    [self.actionButtonOut setTitle:currentTile.actionButtonName forState:UIControlStateNormal];
    self.storyLabel.text = currentTile.story;
    self.imagemDeFundo.image = currentTile.backgroundImage;
    // Adicionar Lógica de Ação já feita e esconder o botão de ação.
    int mapeamento = 3*self.mapCoordinates.x + self.mapCoordinates.y;
    if([[self.actionDoneAtTile objectAtIndex:mapeamento] isEqualToString:@"NO"]){
        self.actionButtonOut.hidden = NO;
    }
    else{
        self.actionButtonOut.hidden = YES;
    }
   // if(self.mapCoordinates.x == 3 && self.mapCoordinates.y  ==2) [self bossBattle];
    NSInteger currentLife = [self.healthLabel.text integerValue];
    if(currentLife <= 0){
        self.healthLabel.text = @"0";
        UIAlertView *youDied = [[UIAlertView alloc] initWithTitle:@"Oh Não!" message:@"Você Morreu!!!" delegate:nil cancelButtonTitle:@"Volte para o começo" otherButtonTitles:nil];
        self.actionButtonOut.hidden = YES;
        self.northButton.hidden = YES;
        self.southButton.hidden = YES;
        self.eastButton.hidden = YES;
        self.westButton.hidden = YES;
        [youDied show];
    }
}




-(void)updateButtonsVisibility
{
    if (self.mapCoordinates.x == 0) {
        self.westButton.hidden = YES;
    }
    else self.westButton.hidden = NO;
    
    if (self.mapCoordinates.x == 3) {
        self.eastButton.hidden = YES;
    }
    else self.eastButton.hidden = NO;
    
    if (self.mapCoordinates.y == 0) {
        self.southButton.hidden = YES;
    }
    else self.southButton.hidden = NO;
    
    if (self.mapCoordinates.y == 2) {
        self.northButton.hidden = YES;
    }
    else self.northButton.hidden = NO;
    
}


- (IBAction)northButtonPressed:(UIButton *)sender
{
    if([self.actionButtonOut isHidden])
    {
        self.mapCoordinates = CGPointMake(self.mapCoordinates.x, self.mapCoordinates.y +1);
        [self updateCurrentTile];
    }
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    if([self.actionButtonOut isHidden])
    {
        self.mapCoordinates = CGPointMake(self.mapCoordinates.x, self.mapCoordinates.y -1);
        [self updateCurrentTile];
    }
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    if([self.actionButtonOut isHidden])
    {
        self.mapCoordinates = CGPointMake(self.mapCoordinates.x-1, self.mapCoordinates.y);
        [self updateCurrentTile];
    }
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    if([self.actionButtonOut isHidden])
    {
        self.mapCoordinates = CGPointMake(self.mapCoordinates.x+1, self.mapCoordinates.y);
        [self updateCurrentTile];
    }
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    NSInteger vidaAtual = [self.healthLabel.text integerValue];
    if (self.bossLife <= 0 && vidaAtual > 0)
    {
        [audioPlayer1 stop];
        audioPlayer1.currentTime = 0;
        [audioPlayer1 play];
    }
    self.mapCoordinates = CGPointMake(0, 0);
    self.healthLabel.text = [NSString stringWithFormat:@"%i", 10];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", 1];
    self.weaponNameLabel.text = @"Wood Sword";
    self.armorNameLabel.text = @"Socks";
    self.bossLife = defBossLife;
    for (int n = 0; n < 12; n++)
        [self.actionDoneAtTile replaceObjectAtIndex:n withObject:@"NO"];
    [self updateCurrentTile];
}


- (IBAction)actionButtonPressed:(UIButton *)sender
{
    if(self.mapCoordinates.x == 3 && self.mapCoordinates.y ==2){
        self.bossLife -= [self.damageLabel.text integerValue];
        self.healthLabel.text = [NSString stringWithFormat:@"%i", [self.healthLabel.text integerValue] - self.bossDamage];
        if([self.healthLabel.text integerValue] <=0)
        {
            self.healthLabel.text = @"0";
            UIAlertView *youDied = [[UIAlertView alloc] initWithTitle:@"Oh Não!" message:@"Você Morreu!!!" delegate:nil cancelButtonTitle:@"Volte para o começo" otherButtonTitles:nil];
            [youDied show];
            self.actionButtonOut.hidden = YES;
            self.northButton.hidden = YES;
            self.southButton.hidden = YES;
            self.eastButton.hidden = YES;
            self.westButton.hidden = YES;
        }
        else if(self.bossLife <=0){
            UIAlertView *youWon = [[UIAlertView alloc] initWithTitle:@"Parabéns!!!" message:@"Você Ganhou!!!" delegate:nil cancelButtonTitle:@"Fim da Jornada" otherButtonTitles:nil];
            [youWon show];
            self.actionButtonOut.hidden = YES;
            self.northButton.hidden = YES;
            self.southButton.hidden = YES;
            self.eastButton.hidden = YES;
            self.westButton.hidden = YES;
           
            // Ajustar o vídeo
            [self playMovie:self];
        }
    }
    else{
        NSArray *titlesArray = [self.currentFactory tiles];
        LRMTile *currentTile = [[titlesArray objectAtIndex:self.mapCoordinates.x]objectAtIndex:self.mapCoordinates.y];
        if(currentTile.tileWeapon.name != nil)
        {
            int dano = [self.damageLabel.text integerValue];
            dano += currentTile.tileWeapon.damageBonus;
            self.damageLabel.text = [NSString stringWithFormat:@"%i", dano];
            self.weaponNameLabel.text = currentTile.tileWeapon.name;
        }
        else if(currentTile.tileArmor.healthBonus != 0)
        {
            int life = [self.healthLabel.text integerValue];
            life += currentTile.tileArmor.healthBonus;
            self.healthLabel.text = [NSString stringWithFormat:@"%i", life];
            if(currentTile.tileArmor.name != nil) self.armorNameLabel.text = currentTile.tileArmor.name;
        }
        int mapeamento = 3*self.mapCoordinates.x + self.mapCoordinates.y;
        [self.actionDoneAtTile replaceObjectAtIndex:mapeamento withObject:@"YES"];
        [self updateCurrentTile];
    }
}


-(void)playMovie:(id)sender
{
    [audioPlayer1 stop];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"PASSEI" ofType:@"mov"]];
    if(url !=nil){
        
        AVPlayer *player = [AVPlayer playerWithURL:url];
        AVPlayerViewController *playerViewController = [AVPlayerViewController new];
        playerViewController.player = player;
        [self presentViewController:playerViewController animated:YES completion:^{
          [playerViewController.player play];
        }];
    }
    else NSLog(@"URL NÃO ENCONTRADA");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

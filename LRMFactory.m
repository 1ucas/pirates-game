//
//  LRMFactory.m
//  Pirate Assigment
//
//  Created by Lucas Maciel on 6/18/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import "LRMFactory.h"
#import "LRMTile.h"
#import "LRMWeapon.h"

@implementation LRMFactory

-(NSArray*)tiles
{
    LRMTile *tile1 =  [[LRMTile alloc] init];
    tile1.story = @"Você começou sua jornada pequeno herói. Pegue essa espada para lhe ajudar.";
    tile1.actionButtonName = @"Pegar Espada de Prata";
    tile1.tileWeapon = [[LRMWeapon alloc] init];
    tile1.tileWeapon.name = @"Silver Sword";
    tile1.tileWeapon.damageBonus = 5;
    tile1.backgroundImage = [UIImage imageNamed:@"valley1.jpg"];
    
    LRMTile *tile2 =  [[LRMTile alloc] init];
    tile2.actionButtonName = @"Passar pelas armadilhas.";
    tile2.story = @"Você entrou no bosque de gelo. Cuidado com as armadilhas.";
    tile2.tileArmor = [[LRMArmor alloc]init];
    tile2.tileArmor.name = nil;
    tile2.tileArmor.healthBonus = -2;
    tile2.backgroundImage = [UIImage imageNamed:@"woodBackground.jpg"];
    
    LRMTile *tile3 =  [[LRMTile alloc] init];
    tile3.actionButtonName = @"Pular os espinhos.";
    tile3.story = @"Oh não! Um buraco cheio de espinhos em seu caminho! Cuidado pequeno herói.";
    tile3.tileArmor = [[LRMArmor alloc]init];
    tile3.tileArmor.name = nil;
    tile3.tileArmor.healthBonus = -2;
    tile3.backgroundImage = [UIImage imageNamed:@"woodBackground.jpg"];
    
    
    LRMTile *tile4 =  [[LRMTile alloc] init];
    tile4.actionButtonName = @"Recupere sua Vida";
    tile4.story = @"Você encontrou uma fonte da juventude. Aproveite esse momento para reestabelecer sua força.";
    tile4.tileArmor = [[LRMArmor alloc]init];
    tile4.tileArmor.name = nil;
    tile4.tileArmor.healthBonus = 4;
    tile4.backgroundImage = [UIImage imageNamed:@"waterBlue.jpg"];
    
    LRMTile *tile5 =  [[LRMTile alloc] init];
    tile5.actionButtonName = @"Lute contra os Piratas";
    tile5.story = @"Durante sua viagem, você foi emboscado por piratas. Apesar de serem muitos, você é capaz de derrota-los.";
    tile5.tileArmor = [[LRMArmor alloc]init];
    tile5.tileArmor.name = nil;
    tile5.tileArmor.healthBonus = -3;
    tile5.backgroundImage = [UIImage imageNamed:@"pirates2.jpg"];
    
    LRMTile *tile6 =  [[LRMTile alloc] init];
    tile6.actionButtonName = @"Pegar Armadura de Gelo";
    tile6.story = @"Dentro de uma gruta, você encontrou a armadura mística de gelo!";
    tile6.tileArmor = [[LRMArmor alloc]init];
    tile6.tileArmor.name = @"Armadura de Gelo";
    tile6.tileArmor.healthBonus = 5;
    tile6.backgroundImage = [UIImage imageNamed:@"woodBackground.jpg"];
    
    LRMTile *tile7 =  [[LRMTile alloc] init];
    tile7.actionButtonName = @"Recupere sua Vida";
    tile7.story = @"Em seu caminho havia uma placa que dizia: No bosque da paz, você pode deitar a cabeça em paz.";
    tile7.tileArmor = [[LRMArmor alloc]init];
    tile7.tileArmor.name = nil;
    tile7.tileArmor.healthBonus = 3;
    tile7.backgroundImage = [UIImage imageNamed:@"valley3.jpg"];
    
    LRMTile *tile8 =  [[LRMTile alloc] init];
    tile8.actionButtonName = @"Pegar Espada de Ouro";
    tile8.story = @"A força de um heroi é medida pela qualidade de sua arma. Por seu grande merito, foi aberto o caminho para a espada de ouro!";
    tile8.tileWeapon = [[LRMWeapon alloc]init];
    tile8.tileWeapon.name = @"Espada de Ouro";
    tile8.tileWeapon.damageBonus = 5;
    tile8.backgroundImage = [UIImage imageNamed:@"yellowBackground.jpg"];
    
    LRMTile *tile9 =  [[LRMTile alloc] init];
    tile9.actionButtonName = @"Pegar Espada de Diamante";
    tile9.story = @"Depois de longas batalhas, você encontrou no meio da floresta um templo sagrado, que guardava a lendária Espada de Diamante";
    tile9.tileWeapon = [[LRMWeapon alloc]init];
    tile9.tileWeapon.name = @"Espada de Diamante";
    tile9.tileWeapon.damageBonus = 5;
    tile9.backgroundImage = [UIImage imageNamed:@"valley2.jpg"];
    
    LRMTile *tile10 = [[LRMTile alloc] init];
    tile10.actionButtonName = @"Pegar Armadura de Ouro";
    tile10.story = @"Você está se aproximando! Para completar seu destino, os mestres da montanha lhe concederam a armadura de Ouro!!!!";
    tile10.tileArmor = [[LRMArmor alloc]init];
    tile10.tileArmor.name = @"Armadura de Ouro";
    tile10.tileArmor.healthBonus = 5;
    tile10.backgroundImage = [UIImage imageNamed:@"valley1.jpg"];
    
    
    LRMTile *tile11 = [[LRMTile alloc] init];
    tile11.actionButtonName = @"Abrir o baú do destino.";
    tile11.story = @"Logo antes de seu destino final, você encontrou o baú do destino. O que será que tem dentro dele?";
    tile11.tileArmor = [[LRMArmor alloc]init];
    tile11.tileArmor.name = nil;
    tile11.tileArmor.healthBonus = -5;
    tile11.backgroundImage = [UIImage imageNamed:@"woodBackground.jpg"];
    
    LRMTile *tile12 = [[LRMTile alloc] init];
    tile12.actionButtonName = @"Lute contra o Boss Final!!!";
    tile12.story = @"Finalmente, o grande Dragão! Lute pequeno herói! Essa é a batalha de sua vida!";
    tile12.backgroundImage = [UIImage imageNamed:@"dragon.jpg"];

    
    
    NSArray *column1Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3,nil];
    
    NSArray *column2Array = [[NSArray alloc] initWithObjects:tile4, tile5, tile6,nil];
    
    NSArray *column3Array = [[NSArray alloc] initWithObjects:tile7, tile8, tile9,nil];
    
    NSArray *column4Array = [[NSArray alloc] initWithObjects:tile10, tile11, tile12,nil];
    
    NSArray *tilesArray = [[NSArray alloc] initWithObjects:column1Array, column2Array, column3Array, column4Array,nil];
    
    return tilesArray;
}

@end

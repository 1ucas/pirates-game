//
//  LRMChar.h
//  Pirate Assigment
//
//  Created by Lucas Maciel on 6/18/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRMArmor.h"
#import "LRMWeapon.h"

@interface LRMChar : NSObject


@property (nonatomic, strong) NSString *name;

@property (nonatomic) int health;

@property (nonatomic) int damage;

@property (nonatomic, strong) LRMArmor *charArmor;

@property (nonatomic, strong) LRMWeapon *charWeapon;


-(void)setArmor:(LRMArmor*)newArmor;

-(void)setWeapon:(LRMWeapon*)newWeapon;

-(BOOL)isDead;

-(void)receiveDamage:(int)damagePoints;



@end

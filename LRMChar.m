//
//  LRMChar.m
//  Pirate Assigment
//
//  Created by Lucas Maciel on 6/18/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import "LRMChar.h"

@implementation LRMChar


-(void)receiveDamage:(int)damagePoints
{
    self.health -= damagePoints;
}


-(BOOL)isDead
{
    if (self.health <= 0) {
        return YES;
    }
    else return NO;
}


-(void)setArmor:(LRMArmor*)newArmor
{
    self.health -= self.charArmor.healthBonus;
    self.health += newArmor.healthBonus;
}

-(void)setWeapon:(LRMWeapon*)newWeapon
{
    self.damage -= self.charWeapon.damageBonus;
    self.damage += newWeapon.damageBonus;
}




@end

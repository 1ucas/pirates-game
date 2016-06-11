//
//  LRMTile.h
//  Pirate Assigment
//
//  Created by Lucas Maciel on 6/18/14.
//  Copyright (c) 2014 Lucas Maciel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRMWeapon.h"
#import "LRMArmor.h"

@interface LRMTile : NSObject

@property (nonatomic,strong) UIImage *backgroundImage;

@property (nonatomic, strong) NSString *story;

@property (nonatomic, strong) NSString *actionButtonName;

@property (nonatomic, strong) LRMWeapon *tileWeapon;

@property (nonatomic, strong) LRMArmor *tileArmor;

@property (nonatomic) int healthEffect;

@end

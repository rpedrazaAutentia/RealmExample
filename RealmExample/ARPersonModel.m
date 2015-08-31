//
//  ARPersonModel.m
//  RealmExample
//
//  Created by Raúl Pedraza on 27/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "ARPersonModel.h"

@implementation ARPersonModel


-(instancetype) initWithName:(NSString *)name lastName:(NSString *) lastName{

    if (self = [super init]) {
        _name = name;
        _lastName = lastName;
    }
    
    return self;
}

@end

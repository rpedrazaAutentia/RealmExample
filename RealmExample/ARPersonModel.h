//
//  ARPersonModel.h
//  RealmExample
//
//  Created by Raúl Pedraza on 27/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <Realm/Realm.h>

@interface ARPersonModel : RLMObject

@property NSString *name;
@property NSString *lastName;
- (instancetype) initWithName:(NSString *)name lastName:(NSString *) lastName;

@end

RLM_ARRAY_TYPE(ARPersonModel)
//
//  ARTableViewController.h
//  RealmExample
//
//  Created by Raúl Pedraza on 31/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARPersonModel.h"

@interface ARTableViewController : UITableViewController
- (void)saveModel:(ARPersonModel *) person;
- (void)removeModel:(ARPersonModel *) person;
- (void)updateModel:(ARPersonModel *) person name:(NSString *) name lastName:(NSString *) lastName;
@end

//
//  ARTableViewController.m
//  RealmExample
//
//  Created by Raúl Pedraza on 31/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "ARTableViewController.h"
#import "ARPersonModel.h"

@interface ARTableViewController ()

@property RLMArray <ARPersonModel> *persons;

@end

@implementation ARTableViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
//    
//        //Instanciamos nuestro modelo
//        ARPersonModel *person = [[ARPersonModel alloc]init];
//    
//        //Asignamos valores a sus propiedades.
//        person.name = @"Raúl";
//        person.lastName = @"Pedraza";
//    
//        //Creamos nuestro "Reino" indicando que nos creara en la ruta por defecto asignada una BBDD con nombre default.
//        RLMRealm *realm       = [RLMRealm defaultRealm];
//    
//        //Le decimos a Realm que va a ser temporalmente de escritura, ya que por defecto es solo lectura.
//        [realm beginWriteTransaction];
//    
//        //Persistimos el modelo en la BBDD.
//        [realm addObject:person];
//    
//        //Completamos proceso y liberamos y le decimos a Realm que ahora veulve a ser solo de lectura.
//        [realm commitWriteTransaction];
    
    self.persons = [ARPersonModel allObjects];
    [self configButtons];
    
}

#pragma mark - Actions
- (void)deletePerson:(UIBarButtonItem *)sender {
    NSLog(@"Delete button");
    
}

- (void)addPerson:(UIBarButtonItem *)sender {
    
    NSLog(@"Add button");
    ARPersonModel *person = [[ARPersonModel alloc]initWithName:@"Nuevo" lastName:@"Persona"];
    [self saveModel:person];
    [self.tableView reloadData];
}




#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.persons.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARPersonModel *model = self.persons[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.lastName;
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARPersonModel *person = [self.persons objectAtIndex:indexPath.row];
    [self removeModel:person];
    [self.tableView reloadData];
    
}

#pragma mark - DataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARPersonModel *model = self.persons[indexPath.row];
    
    [self updateModel:model name:@"Persona" lastName:@"Modificada"];
    
}


#pragma mark - Persistence Methods

- (void)saveModel:(ARPersonModel *) person {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:person];
    [realm commitWriteTransaction];
    
}

- (void)removeModel:(ARPersonModel *) person {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:person];
    [realm commitWriteTransaction];
    
}

- (void)updateModel:(ARPersonModel *) model name:(NSString *) name lastName:(NSString *) lastName {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    model.name      = name;
    model.lastName  = lastName;
    [realm commitWriteTransaction];
    
}

#pragma mark - ConfigButtons

-(void) configButtons {

    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPerson:)];
    self.navigationItem.rightBarButtonItem = add;
}

@end

//
//  ViewController.m
//  Contacts
//
//  Created by James Birchall on 03/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"  // product-Swift.h

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contactsList;

@end

@implementation ContactsViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        NSArray *contactArray = @[@"Johnny Appleseed",
//                                  @"Paul Bunyan",
//                                  @"Calamity Jane"];
        
//        Contact *c1 = [[Contact alloc] initWithContactName:@"Johnny Appleseed"];
//        Contact *c2 = [[Contact alloc] initWithContactName:@"Paul Bunyan"];
//        Contact *c3 = [[Contact alloc] initWithContactName:@"Calamity Jane"];
        
//        _contactsList = [NSMutableArray arrayWithArray:@[c1, c2, c3]];
        
        _contactsList = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    Contact *contact = self.contactsList[indexPath.row];
    
    cell.textLabel.text = contact.name;
    
    return cell;
}

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)sender {
    // no action to take
}

@end

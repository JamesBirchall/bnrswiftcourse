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
    
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.secondName];
    
    cell.textLabel.text = fullName;
    
    return cell;
}

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)sender {
    // no action to take
}

- (IBAction)createNewContact:(UIStoryboardSegue *)sender {
    NewContactViewController * contactVC = sender.sourceViewController;
    
    NSString *firstName = contactVC.firstNameTextField.text;
    NSString *lastName = contactVC.lastNameTextFIeld.text;
    
    if (firstName.length != 0 && lastName.length != 0) {

        Contact *newContact = [[Contact alloc] initWithFirstName:firstName secondName:lastName];
        
        [self.contactsList addObject:newContact];
        [self.tableView reloadData];
    }
}

// silver challange - segue into the existing Contacts View Controller
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact *contact = self.contactsList[indexPath.row];    //get contact selected
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ExistingContactViewController *viewController = (ExistingContactViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ExistingContact"];
    
    viewController.firstName = contact.firstName;
    viewController.secondName = contact.secondName;
    viewController.locationInIndex = indexPath.row;
    
    NSLog(@"%@ %@", contact.firstName, contact.secondName);
    
    [self.navigationController pushViewController:viewController animated:true];
}

// gold challenge - save contact back to list when saving
- (IBAction)updateExistingContact:(UIStoryboardSegue *)sender {
    ExistingContactViewController *contactVC = sender.sourceViewController;
    
    // how can we know which - lets search the array for them!
    NSString *newFirstName = contactVC.firstNameTextField.text;
    NSString *newSecondName = contactVC.lastNameTextFIeld.text;
    
    Contact *updatedContact = [[Contact alloc] initWithFirstName:newFirstName secondName:newSecondName];
    
    // update from index location of the contactVC.locationInIndex
    [self.contactsList replaceObjectAtIndex:contactVC.locationInIndex withObject:updatedContact];
    [self.tableView reloadData];
    
    NSLog(@"Loaded back to existing");
}


@end

//
//  TableViewController.m
//  EveryDo_It_Again
//
//  Created by Trevor MacGregor on 2017-03-29.
//  Copyright © 2017 Trevor MacGregor. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "TableViewCell.h"
#import "AppDelegate.h"
#import "ToDoEntity+CoreDataProperties.h"

@interface TableViewController ()<AddNewToDoDelegate>

@property (nonatomic,strong) NSMutableArray<ToDoEntity*> *toDos;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.rowHeight = 150;

    
    self.toDos = [@[] mutableCopy];
    self.navigationItem.title = @"To Do List";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    [self fetchObject];

}


- (void)fetchObject {
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = del.persistentContainer.viewContext;
    
    NSFetchRequest *fetchRequest = [ToDoEntity fetchRequest];
    NSError *error;
    NSArray<ToDoEntity*> *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        // Handle the error.
        NSLog(@"%@", error.localizedDescription);
    }
    
    //NSLog(@"%d: %@", __LINE__, ((ToDoEntity*)fetchedObjects[0]).todo_title);
    self.toDos = [fetchedObjects mutableCopy];
}


//triggers segue to second VC to add new to do
- (void)addItem:(id)sender
{
    [self performSegueWithIdentifier:@"addNewItem" sender:self];
    
}
#pragma mark - didSaveToDo
- (void)didSaveToDo:(ToDoEntity *)todo
{
    [self.toDos addObject:todo];
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.toDos.count;

}

//configure the cell to our fetched data

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDo_ItemRow" forIndexPath:indexPath];
    ToDoEntity *todo = self.toDos[indexPath.row];
    cell.toDoTitleLabel.text = todo.todo_title;
    cell.descriptionLabel.text = todo.todo_description;
    cell.priorityLabel.text = todo.todo_priority;
    cell.doneLabel.text = todo.todo_done;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addNewItem"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.delegate = self;
    }
}


@end

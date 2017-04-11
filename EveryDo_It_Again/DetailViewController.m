//
//  DetailViewController.m
//  EveryDo_It_Again
//
//  Created by Trevor MacGregor on 2017-03-29.
//  Copyright © 2017 Trevor MacGregor. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

#import "ToDoEntity+CoreDataProperties.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UITextField *detailTitle;
@property (strong, nonatomic) IBOutlet UITextField *detailDescription;
@property (strong, nonatomic) IBOutlet UITextField *detailPriority;
@property (strong, nonatomic) IBOutlet UITextField *detailDone;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




- (IBAction)saveButton:(id)sender {
    ToDoEntity *todo = [self createObject];
    [self.delegate didSaveToDo:todo];
    [self.navigationController popViewControllerAnimated:YES];
}

- (ToDoEntity*)createObject {
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = del.persistentContainer.viewContext;
    ToDoEntity *newObject = [NSEntityDescription
                             insertNewObjectForEntityForName:@"ToDoEntity"
                             inManagedObjectContext:context];
    newObject.todo_title = self.detailTitle.text;
    newObject.todo_description = self.detailDescription.text;
    newObject.todo_priority = self.detailPriority.text;
    newObject.todo_done = self.detailDone.text;
    [del saveContext];
    return newObject;
}




@end

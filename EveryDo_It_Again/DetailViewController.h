//
//  DetailViewController.h
//  EveryDo_It_Again
//
//  Created by Trevor MacGregor on 2017-03-29.
//  Copyright © 2017 Trevor MacGregor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDoEntity;

@protocol AddNewToDoDelegate <NSObject>
- (void)didSaveToDo:(ToDoEntity *)todo;

@end

@interface DetailViewController : UIViewController

@property (nonatomic, weak)id<AddNewToDoDelegate> delegate;


@end

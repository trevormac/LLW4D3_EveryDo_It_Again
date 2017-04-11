//
//  TableViewCell.h
//  EveryDo_It_Again
//
//  Created by Trevor MacGregor on 2017-03-29.
//  Copyright © 2017 Trevor MacGregor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *priorityLabel;
@property (strong, nonatomic) IBOutlet UILabel *doneLabel;

@end

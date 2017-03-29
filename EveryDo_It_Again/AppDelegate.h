//
//  AppDelegate.h
//  EveryDo_It_Again
//
//  Created by Trevor MacGregor on 2017-03-29.
//  Copyright © 2017 Trevor MacGregor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


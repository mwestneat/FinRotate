//
//  AppDelegate.h
//  FinRotate
//
//  Created by Mark Westneat on 4/1/18.
//  Copyright © 2018 Mark Westneat. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;


@end


//
//  IPICoreDataManager.h
//  JSSafeCoreData
//
//  Created by ipi on 2017/1/4.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface IPICoreDataManager : NSObject

+(instancetype)shareDBManager;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
